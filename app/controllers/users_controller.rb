class UsersController < ApplicationController
  before_action :set_variant, only: [:refer]


  def create
    @referrer_code = params[:param2] # "value2"
    @user = User.new(email: params[:param1])
    @user.referrer = User.find_by_referral_code(@referrer_code) if @referrer_code
    if @user.save
        cookies[:h_email] = { value: @user.email, expires: 52.week.from_now }
        redirect_to rent_a_yoda_refer_a_friend_path
        # redirect_to rent_a_yoda_path, alert: 'An email has been send! verify it to get early access'
      else
        logger.info('Error saving user')
        redirect_to rent_a_yoda_path, alert: 'Error saving your email'
      end
  end

  def refer
    @refer_friend_navbar = true

    session[:expires_at] = Time.now + 5
    @nav_link_refer = true
    @user = User.find_by_email(cookies[:h_email])

    if @user.nil?
      respond_to do |format|
        format.html(&:phone)
        redirect_to root_path, alert: 'Something went wrong!'
      end
    else
      respond_to do |format|
        format.html(&:phone) # refer.html.erb
      end
    end
  end

  def email_verification
    ref_code = cookies[:h_ref]
    @user = User.new(user_params)
    @user.referrer = User.find_by_referral_code(ref_code) if ref_code

    if User.find_by_email(@user.email).nil?
      if @user.valid?
        UserMailer.email_verification(@user).deliver_now
      else
        redirect_to rent_a_yoda_path, alert: 'Error sending your email. Try again.'
      end
    else
      logger.info('This user already subscribed')
      redirect_to rent_a_yoda_path, alert: 'This user already subscribed'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
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
end
