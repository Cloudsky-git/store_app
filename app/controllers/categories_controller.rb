class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index 
    @categories = Category.all
  end

  def show 
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def add 

  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save 
      redirect_to categories_path
    else
      render :new
    end
  end

  private 

  def category_params 
    params.require(:category).permit(:name, :description)
  end

end