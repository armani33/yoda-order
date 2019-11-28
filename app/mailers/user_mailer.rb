class UserMailer < ApplicationMailer
  default from: 'YodaCity <contact@yoda-city.com>'

  def email_verification(user)
    @user = user

    mail(to: @user.email, subject: 'Verify your email and get free kilometers')
  end
end
