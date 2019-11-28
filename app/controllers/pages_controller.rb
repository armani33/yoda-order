class PagesController < ApplicationController
  before_action :set_variant, only: [:main, :rent, :buy, :cart, :warranty, :faq, :delivery, :returns, :privacy_policy, :terms_of_use]
  before_action :format, only: [:main, :rent, :buy, :cart, :warranty, :faq, :delivery, :returns, :privacy_policy, :terms_of_use]
  before_action :skip_rent_a_yoda_page, only: :rent
  def main
    @user = User.new
  end

  def rent
    @user = User.new
    @rent_navbar = true
  end

  def buy
    @user = User.new
    @buy_navbar = true
  end

  def cart
    @user = User.new
  end

  def warranty
    @user = User.new
  end

  def faq
    @user = User.new
  end

  def delivery
    @user = User.new
  end

  def returns
    @user = User.new
  end

  def privacy_policy
    @user = User.new
  end

  def terms_of_use
    @user = User.new
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

  def skip_rent_a_yoda_page
    return if Rails.application.config.ended

    email = cookies[:h_email]
    if email && User.find_by_email(email)
      redirect_to rent_a_yoda_refer_a_friend_path
    else
      cookies.delete :h_email
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

end
