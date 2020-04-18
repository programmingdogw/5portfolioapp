class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @parentcategories = Category.where(ancestry:nil)
  end

  def show
    
  end

end
