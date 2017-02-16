class SendSharingEmail
  def self.run(email)
    SharingMailer.sharing_email(email).deliver_now
  end
end