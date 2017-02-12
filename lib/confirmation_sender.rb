module ConfirmationSender
  def self.send_confirmation_to(phone_number, verification_code)
    MessageSender.send_code(phone_number, verification_code)
  end
end