class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to "/admin/categories", notice: "Categoría creada exitosamente"
    else
      render :new
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to "/admin/categories", notice: "Categoría eliminada exitosamente"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
