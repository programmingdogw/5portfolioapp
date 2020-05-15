class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
 
 
    @items = Item.where(user_id:@user.id)
    @auctionitems = @items.where(sold:0)
    @solditems = @items.where(sold:1)

  end

  def edit
    @user = User.find(params[:id])
  end

  
end


