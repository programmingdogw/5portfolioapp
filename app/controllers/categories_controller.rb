class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @parentcategories = Category.where(ancestry:nil)
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.children
    @items = Item.where(childcategory:@category.id)
  end

end
