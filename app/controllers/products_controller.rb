class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :check_admin_status, except:[:index,:show]
  def index
  	@products = Product.includes(:category)
  	#@categories = Category.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(params[:product].permit(:name, :category_id, :price, :description))
  	if @product.save
  		redirect_to products_path, notice: "Product succesfully created!"
  	else
  		render action: "new"
  	end
  end

  def show
    @product = Product.find(params[:id])
    @item = Item.new(product_id: @product.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product].permit(:name,:price,:category_id, :description))
      redirect_to product_path(@product.id), notice: "Product succesfully updated!"
    else
      render action: "edit"
    end
  end
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path, notice: "Product deleted"
    else
      redirect_to product_path(@product.id)
    end
  end
end
