
require "#{Rails.root}/lib/aes_encryption/aes_module.rb"

class OrdersController < ApplicationController

  def index

    if !logged_in?
      redirect_to login_path
    end

    if !@current_user.verified?
      redirect_to @current_user
    end

    @orders = @current_user.orders

  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @orders = current_user.orders
    @order = Order.new(order_params)
    if @order.save
      tmp = true
      if tmp.present?

      end
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
     @orders = current_user.orders
     @order = Order.find(params[:id])
     if @order.try(:update_attributes, order_params)
       flash[:success] = "Updated successfully!"
     end
  end

  def delete
    @order = Order.find(params[:selected_order])
  end

  def destroy
    @orders = current_user.orders
    @order = Order.find(params[:id])
    @Order.destroy
    if @order.try(:destroy )
      flash[:success] = "Selected order successfully deleted!"
    end
    @orders = current_user.orders
  end

  # def create_kraken
  #   API_KEY = 'DPlHo0jK9gmGjB3w+YygCEFgbxAL7gTKfvlkUNgwKmUra7UcR/XScH4F'
  #   API_SECRET = 'wfPQMISNpisdsBrE0ku0Wn7lykeTabpT0vuBFxPZnee0iTcxH5gMrYAlrXHIxgSFw78MwFZ/pJNBpR4D47eA9g=='
  #
  #   @client = KrakenClient.load({ api_key: 'DPlHo0jK9gmGjB3w+YygCEFgbxAL7gTKfvlkUNgwKmUra7UcR/XScH4F',
  #                                api_secret: 'wfPQMISNpisdsBrE0ku0Wn7lykeTabpT0vuBFxPZnee0iTcxH5gMrYAlrXHIxgSFw78MwFZ/pJNBpR4D47eA9g==',
  #                                  base_uri: 'https://api.kraken.com', tier: 1})
  #   @opts = {
  #       pair: 'XBTXRP',
  #       type: 'buy',
  #       ordertype: 'market',
  #       volume: 0.01
  #   }
  #   @client.private.add_order(@opts)
  # end

  private

  def order_params
    params.require(:order).permit(:user_id, :order_name, :api_key, :api_secret_key, :exchange_type,
                                  :frequency_type, :rate, :amount)
  end
end

