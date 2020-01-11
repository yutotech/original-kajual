class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: ENV_MAIL["MAIL"], subject: "お問い合わせがありました"
  end
end