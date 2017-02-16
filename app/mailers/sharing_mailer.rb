class SharingMailer < ApplicationMailer
  def sharing_email(email, repo)
    @link = repo.download_link
    mail(to: email, subject: "Someone wants to share a document with you!")
  end
end
