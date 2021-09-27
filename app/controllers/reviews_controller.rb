class ReviewsController < ApplicationController

  def new
    @review = Review.new(review_params)
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review created!"
      redirect_back(fallback_location: @user)
    else
      flash[:danger] = "Review create failed!"
      redirect_back(fallback_location: @user)
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] = "Review updated!"
      redirect_to courses_path
    else
      flash[:danger] = "Review is not updated!"
      redirect_back(fallback_location: @user)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted!"
    redirect_back(fallback_location: @user)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :course_id, :content)
  end
end
