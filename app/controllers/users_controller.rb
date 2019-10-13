class UsersController < ApplicationController
  before_action :set_variant, only: [:new_buy, :new_test]
  def new_buy
    @user = User.new
    respond_to do |format|
      format.html(&:phone)
      # do |html|
      # html.phone
      # html.tablet
      # end
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Thanks for the subscription."
      redirect_to root_path
    else
      # render :new => ca c'est si on veut rediriger vers une def local
      flash[:error] = "something went wrong"
      redirect_to root_path
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
