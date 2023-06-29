class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @posts = Post.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new 
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @category = Category.find(params[:category_id])
    @category.products.new(product_params)

    if @product.save 
      redirect_to categories_path(@product.category_id)
    else
      @category = Category.find(params[:category_id])
      render :new
    end
  end

  private 

  def product_params 
    params.require(:product).permit(:title, :description)
  end
end