class ContactMailer < ApplicationMailer
  default from: 'YodaCity <contact@yoda-city.com>'

  def contact_us(message)
    @message = message
    mail(:from => @message.email, to: "test@blackhole.postmarkapp.com", subject: "Yodacity contact form")

    @body = @message.message
  end
end
