class ContactMailer < ApplicationMailer
  default from: 'YodaCity <contact@yoda-city.com>'

  def contact_us(message)
    @message = message
    mail(from: "contact@yoda-city.com", to: "contact@yoda-city.com", subject: "Yodacity contact form")

    @body = @message.message
  end
end
