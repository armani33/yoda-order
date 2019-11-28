class UserMailer < ApplicationMailer
  default from: 'YodaCity <contact@yoda-city.com>'

  def email_verification(user)
    @user = user
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/Logo/Logo-email.png")
    mail(to: @user.email, subject: 'Verify your email and get free kilometers')
  end
end
