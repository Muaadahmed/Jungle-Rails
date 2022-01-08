class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @categories = Category.new(product_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @categories = Category.find params[:id]
    @categories.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def product_params
    params.require(:categories).permit(
      :name
    )
  end
end
