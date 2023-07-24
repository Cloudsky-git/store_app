class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]

  def show
    @products = Product.all
    @product = Product.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def new 
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @product.category_id = params[:category_id]

    # @category = Category.find(params[:category_id])
    # @category.products.new(product_params)

    if @product.save
      redirect_to categories_path(@product.category_id)
    else
      @category = Category.find(params[:category_id])
      render :new
    end
  end

  def edit 
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to categories_path
  end

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to categories_path
  end

  private 

  def product_params 
    params.require(:product).permit(:title, :description, :price)
  end
end