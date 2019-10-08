class PagesController < ApplicationController
  before_action :set_variant, only: [:main, :bike, :app, :reviews]
  before_action :format, only: [:main, :bike, :app, :reviews]
  def main
    @user = User.new
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
