class ReviewsController < ApplicationController

  before_filter :authorize, :only => [:create, :destroy]

  def create

     @review = Review.new(review_params)
     @review.user = current_user
     @review.product_id = params[:product_id]

    if @review.save

      redirect_to product_path(params[:product_id])
    else
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )

  end
end
