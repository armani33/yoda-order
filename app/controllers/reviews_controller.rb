class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(user_params)

    if @review.save
      flash[:success] = "Review added"
      render :new
    else
      # render :new => ca c'est si on veut rediriger vers une def local
      flash[:error] = "something went wrong"
      render :new
    end
  end
end
