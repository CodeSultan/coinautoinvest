
class OrderNotifyMailer < ApplicationMailer

  default from: 'gamberg1001@outlook.com'

  def self.notify_success_result(address)
    ActionMailer::Base.mail(from: "gamberg1001@outlook.com", to: address, subject: "Success", body: "Your new order is successfully added.").deliver
  end

  def self.notify_fail_result(address, result)
    ActionMailer::Base.mail(from: "gamberg1001@outlook.com", to: address, subject: "Failed", body: "Your new order is failed - " + result).deliver
  end

end
