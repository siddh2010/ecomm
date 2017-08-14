class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def create 
		@review = Review.new(params[:review].permit(:product_id, :body, :rating))
		@review.user_id = current_user.id
		if @review.save
			redirect_to product_path(@review.product_id), notice: "Review successfully created"
		else
			redirect_to product_path(@review.product_id), notice: "Please try again"
		end
	end
	def destroy
		@review = Review.find(params[:id])
		if @review.destroy
			redirect_to product_path(@review.product_id), notice: "Review deleted"
		else
			redirect_to product_path(@review.product_id), notice: "please try again"
		end
	end
	def update
		@review = Review.find(params[:id])
		if @review.update(params[:review].permit(:body, :rating))
			redirect_to product_path(@review.product_id), notice: "Product updated!"
		else 
			redirect_to product_path(@review.product_id), notice: "Try again"
		end
	end
end
