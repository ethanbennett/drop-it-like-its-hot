module MessageSender
  def self.send_code(phone_number, code)
    client = Twilio::REST::Client.new(ENV['TWILIO_AUTH_TOKEN'], ENV['TWILIO_ACCOUNT_SID'])

    message = client.messages.create(
      from:  ENV['TWILIO_NUMBER'],
      to:    phone_number,
      body:  code
    )

    message.status == 'queued'
  end
end