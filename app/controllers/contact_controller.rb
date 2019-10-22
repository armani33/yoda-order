class ContactController < ApplicationController
  before_action :set_variant, only: [:contact]
  before_action :format, only: [:contact]

  def contact
    @user = User.new
    @contact = Contact.new
  end

  def create
    @message = Contact.new(review_params)

    if @message.valid?
      ContactMailer.contact_us(@message).deliver_now
      redirect_to page_contact_path
      flash[:notice] = "Thank you for your message. We'll get back to you soon!"
    else
      redirect_to page_contact_path
      flash[:notice] = "There was an error sending your message. Please try again."
    end
  end

  private

  def format
    respond_to do |format|
      format.html(&:phone)
      # do |html|
      # html.phone
      # html.tablet
      # end
    end
  end

  def set_variant
    case request.user_agent
    when /iPhone/i
      request.variant = :phone
    when /Android/i && /mobile/i
      request.variant = :phone
    when /Windows Phone/i
      request.variant = :phone
    # when /Android/i
    #   request.variant = :tablet
    # when /iPad/i
    #   request.variant = :tablet
    end
  end

  def review_params
    params.require(:contact).permit(:name, :phone, :email, :message)
  end

end
