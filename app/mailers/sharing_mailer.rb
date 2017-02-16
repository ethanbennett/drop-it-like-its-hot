class SharingMailer < ApplicationMailer
  def sharing_email(email)
    @user = User.find(session[:user_id])
    mail(to: email, subject: "#{@user.first_name} wants to share a document with you!")
  end
end
