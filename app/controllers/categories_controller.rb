class CategoriesController < ApplicationController

	before_action :authenticate_user!
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render action: "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  def listing_by_categories
    @categories = Category.all
  end 


private

  def category_params
    params[:category].permit(:name)
  end

end


