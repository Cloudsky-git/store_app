class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_product, only: [:show] 

  def index
    @posts = Post.all
  end

  def show
  end

  def new 
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @product = Product.new product_values
    @product.category_id = params[:category_id]

    if @product.save 
      redirect_to categories_path(@product.category_id)
    else
      @category = Category.find(params[:category_id])
      render :new
    end
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end

  def product_values 
    params.require(:product).permit(:title, :description)
  end
end