class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_category, only: [ :show]

  def index 
    @categories = Category.all
  end

  def show 
    @products = @category.products
  end

  def add 

  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new category_values

    if @category.save 
      redirect_to categories_path
    else
      render :new
    end
  end

  private 

  def set_category
    @category = Category.find(params[:id])
  end

  def category_values 
    params.require(:category).permit(:name, :description)
  end

end