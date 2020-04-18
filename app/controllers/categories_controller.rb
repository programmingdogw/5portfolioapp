class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @parentcategories = Category.where(ancestry:nil)
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.children
    @childitems = Item.where(childcategory:@category.id)
    @grandchilditems = Item.where(category_id:@category.id)
  end

end
