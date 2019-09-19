class UsersController < ApplicationController

  def new_buy
    @user = User.new
  end

  def new_test
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Thanks for the subscription. We'll get to you nearly"
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
end
