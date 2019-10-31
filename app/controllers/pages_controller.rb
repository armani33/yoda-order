class PagesController < ApplicationController
  before_action :set_variant, only: [:main, :bike, :app, :reviews, :support, :test_ride, :cart, :warranty, :faq, :delivery, :returns, :privacy_policy, :terms_of_use]
  before_action :format, only: [:main, :bike, :app, :reviews, :support, :test_ride, :cart, :warranty, :faq, :delivery, :returns, :privacy_policy, :terms_of_use]
  def main
    @user = User.new
    @reviews = Review.all.shuffle[0..9]
    @orders = 14
  end

  def bike
    @user = User.new
  end

  def app
    @user = User.new
  end

  def reviews
    @user = User.new
    @reviews = Review.all
  end

  def support
    @user = User.new
  end

  def test_ride
    @user = User.new
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
