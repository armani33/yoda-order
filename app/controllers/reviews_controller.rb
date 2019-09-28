class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review added"
      redirect_to reviews_manage_path
    else
      # render :new => ca c'est si on veut rediriger vers une def local
      flash[:error] = "something went wrong"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
     @review = Review.find(params[:id])
     if @review.update(review_params)
       flash[:notice] = 'Review updated!'
       redirect_to reviews_manage_path
     else
       flash[:error] = 'Failed to edit review!'
       redirect_to reviews_manage_path
     end
   end

   def destroy
     @review = Review.find(params[:id])
     if @review.delete
       flash[:notice] = 'Review deleted!'
       redirect_to reviews_manage_path
     else
       flash[:error] = 'Failed to delete this review!'
       redirect_to reviews_manage_path
     end
   end

  def manage
    @reviews = Review.all
  end


  private

  def review_params
    params.require(:review).permit(:name, :city, :country, :rating, :comment, :datum)
  end
end
