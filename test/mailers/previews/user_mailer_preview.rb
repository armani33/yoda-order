# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/email_verification
  def email_verification(user)
    @user = user
    UserMailer.email_verification(@user)
  end

end
