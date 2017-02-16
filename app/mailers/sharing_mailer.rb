class SharingMailer < ApplicationMailer
  def sharing_email(email)
    @user = User.find(session[:user_id])
    # Either pass in email from wherever this method is called or
    # look into accessing params in mailer
    mail(to: email, subject: "#{@user.first_name} wants to share a document with you!")
  end
end
