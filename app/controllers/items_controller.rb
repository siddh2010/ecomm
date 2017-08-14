class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index	
  	@items = current_user.items
  end
  def create
  	if user_signed_in?#only allows to be saved if the user is signed in
	  	@item = Item.new(params[:item].permit(:product_id, :quantity))#fetches info from form and permit product_id and quantity
	  	@item.user_id = current_user.id #sets user_id to current_user.id. Current_user returns the user object for the current user (devise)
	  	if @item.save_update_item
	  		redirect_to items_path, notice: "Product succesfully added to cart" #if validations pass, user redirected to their cart and notice displayed
	  	else
	  		redirect_to product_path(@item.product_id), notice: "Try again" #if validations fail, redirected to the products page and asked to try again
	  	end
	else
		redirect_to product_path(@item.product_id), notice: "You must be signed in to add products to cart"
	end
 end
 def update
 	@item = Item.find(params[:id])
 	if @item.update_attributes(params[:item].permit(:quantity))
 		redirect_to items_path, notice: "Quantity updated!"
 	else
 		redirect_to items_path, notice: "Try again"
 	end
 end
 def destroy
 	@item = Item.find(params[:id])
 	if @item.destroy
 		redirect_to items_path, notice: "Product removed from cart"
 	else
 		redirect_to items_path, notice: "Please try again"
 	end
 end
end
