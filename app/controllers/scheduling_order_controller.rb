
require "#{Rails.root}/lib/bittrex_api/bittrex_api.rb"

class SchedulingOrderController < ApplicationController

  @order = Order.first

  def self.scheduling_order

    File.open("presenttime",'w') do |filea|

    end

    @orders = Order.all

    @orders.each do |order|

        @order = order

        if !order.verified_order?
          next
        end

        @pres = DateTime.now
        @last = order.last_order_time

        if @last == nil
          @last = order.updated_at
        end

        @flag = false

        case order.frequency_type
          when "monthly"

            if @last.day == @pres.day
              @flag = true
            end

          when "weekly"

            pDate = getDayOfWeek(@pres.year, @pres.month, @pres.day)
            lDate = getDayOfWeek(@last.year, @last.month, @last.day)

            if pDate == lDate
              @flag = true
            end
         else @flag = true

        end

        if !@flag
          next
        end

        BittrexApi.new_process(order.api_key, order.api_secret_key, order.exchange_type)
        BittrexApi.buy(order.amount, order.rate)
        order.update(last_order_time: @pres)

    end
  end

  def self.getDayOfWeek(year, month, day)
    date = Date.new(year, month, day)
    return date.wday
  end

  def self.notify_email(flag)
    user = User.find_by(id: @order.user_id)

    if flag?
      OrderNotifyMailer.notify_success_result(user.email)
    else
      OrderNotifyMailer.notify_fail_result(user.email, response['message'])
    end
  end

end
