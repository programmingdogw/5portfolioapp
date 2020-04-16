class ImagesController < ApplicationController

  def destroy
    @item = Item.find(params[:item_id])
    image = Image.find(params[:id])
    user = User.find(@item.user_id)
    if user == current_user      
      if image.destroy
        redirect_to edit_item_path(@item)
      else
        redirect_to root_path
      end

    else
      redirect_to root_path
    end
  end

end
