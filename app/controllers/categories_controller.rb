class CategoriesController < ApplicationController
  # before_action :new_category, only: [:new]
  before_action :set_category, only: [:destroy, :show, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    new_category
  end

  def create
    new_category(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash.notice = "Category #{@category.title} has been updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash.notice = "Category #{@category.title} has been deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def new_category(params = nil)
    @category = Category.new(params)
  end
end
