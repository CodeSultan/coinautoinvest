
require "bittrex/version"
require 'openssl'
require 'json'
require 'open-uri'

module BittrexApi
  class << self
    API_VERSION = 'v1.1'

    def new_process(api_key, api_secret, trade_for)
      @api_key = api_key
      @api_secret = api_secret
      @trade_for = trade_for
    end

    def ticker
      request("https://bittrex.com/api/#{API_VERSION}/public/getticker", "market=#{@trade_for}")
    end

    def summaries
      request("https://bittrex.com/api/#{API_VERSION}/public/getmarketsummaries")
    end

    def getmarketsummary
      request("https://bittrex.com/api/#{API_VERSION}/public/getmarketsummary?market=#{@trade_for}")
    end

    def orderbook(type, depth = 50)
      request("https://bittrex.com/api/#{API_VERSION}/public/getorderbook", "market=#{@trade_for}&type=#{type}&depth=#{depth}")
    end

    def market_history(count = 10)
      request("https://bittrex.com/api/v1.1/public/getmarkethistory", "market=#{@trade_for}&count=#{count}")
    end


    def buy(quantity, rate = nil)
      if rate
        request("https://bittrex.com/api/#{API_VERSION}/market/buylimit", "market=#{@trade_for}&quantity=#{quantity}&rate=#{rate}")
      else
        request("https://bittrex.com/api/#{API_VERSION}/market/buymarket", "market=#{@trade_for}&quantity=#{quantity}")
      end
    end

    def sell(quantity, rate = nil)
      if rate
        request("https://bittrex.com/api/#{API_VERSION}/market/selllimit", "market=#{@trade_for}&quantity=#{quantity}&rate=#{rate}")
      else
        request("https://bittrex.com/api/#{API_VERSION}/market/sellmarket", "market=#{@trade_for}&quantity=#{quantity}")
      end
    end

    def cancel(order_id)
      request("https://bittrex.com/api/#{API_VERSION}/market/cancel", "uuid=#{order_id}")
    end

    def open_orders(market = '')
      request("https://bittrex.com/api/#{API_VERSION}/market/getopenorders", "market=#{@trade_for}")
    end

    def balance(currency)
      request("https://bittrex.com/api/#{API_VERSION}/account/getbalance", "currency=#{currency}")
    end

    def balance_all
      request("https://bittrex.com/api/#{API_VERSION}/account/getbalances?apikey=#{@api_key}")
    end

    def order_history(market = nil, count = 5)
      params = market ? "market=#{@trade_for}&count=#{count}" : "count=#{count}"
      request("https://bittrex.com/api/#{API_VERSION}/account/getorderhistory", params)
    end

    private

    def generate_sign(url, params)
      nonce = Time.now.to_i
      @final_url = "#{url}?apikey=#{@api_key}&nonce=#{nonce}&"+params
      OpenSSL::HMAC.hexdigest(digest = OpenSSL::Digest.new('sha512'), @api_secret, @final_url)
    end

    def handle_response(req)
      response = JSON.load(req)
      if response['success']
        response['result']
        SchedulingOrderController.notify_email(true)
      else
        puts "Request failed: #{response}"
        response['message']
        SchedulingOrderController.notify_email(false)
      end
    end

    def request(url, params = '')
      begin
        hmac_sign = generate_sign(url, params)
        handle_response open(@final_url, 'apisign' => hmac_sign)
      rescue
        return false
      end
    end
  end
end
