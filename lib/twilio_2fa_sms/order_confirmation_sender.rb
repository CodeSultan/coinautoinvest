

module OrderConfirmationSender
  def self.send_confirmation_to(user, order)
    verification_code = generate
    order.update(verification_code: verification_code)
    send_code(user.countryCode + user.phoneNumber, verification_code)
  end

  def self.generate
    rand(100000...999999).to_s
  end

  def self.send_code(phone_number, code)
    # account_sid = ENV['TWILIO_ACCOUNT_SID']
    # auth_token  = ENV['TWILIO_AUTH_TOKEN']

    account_sid = 'AC00ff3bf26186a62bc59e6f96c07bc751'
    auth_token = '202c67d88748420f46862712456836cf'

    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
        # from:  ENV['TWILIO_NUMBER'],
        from: '+12017205884',
        to:    phone_number,
        body:  code
    )
    message.status == 'queued'
  end
end