class ItemsController < ApplicationController
  
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren, :purchase, :done]
  
  
    def index
      @items = Item.includes(:images).order('created_at DESC')
    end
  
  
    def new
      @item = Item.new
      @image = @item.images.new
  
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
  
      # 親カテゴリーが選択された後に動くアクション
      def get_category_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
      end
  
      # 子カテゴリーが選択された後に動くアクション
      def get_category_grandchildren
        #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
          
    end
  
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        redirect_to new_item_path, flash: {itemnotice:'入力されていないか無効な項目があります'}
      end
    end
  
  
  
  
  
    def show
      @item = Item.find(params[:id])
      @user = User.find(@item.user_id)
      @size = Size.find(@item.size_id)
      @condition = Condition.find(@item.condition_id)
      @deliverycost = Deliverycost.find(@item.deliverycost_id)
      @deliverytime = Deliverytime.find(@item.deliverytime_id)
      @child = Category.find(@item.childcategory)
      @grandchild = Category.find(@item.category_id)
      @price = @item.price.to_s(:delimited, delimiter: ',')

      
      gon.payjp_public_key = Rails.application.credentials.payjp[:PAYJP_PUBLIC_KEY]
    
    end
  
  
  
  
  
    def edit
      @item = Item.find(params[:id])
      if @item.sold == 1
        redirect_to unexpectederrors_path
      end
       #セレクトボックスの初期値設定
       @category_parent_array = ["---"]
       #データベースから、親カテゴリーのみ抽出し、配列化
       Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
       end
  
      #  実験中の記述
      @editpage_category_children = Category.find_by(name:@item.parentcategory, ancestry:nil).children
      @editpage_category_grandchildren = Category.find_by(id:@item.childcategory).children
  
      # 親カテゴリーが選択された後に動くアクション
      def get_category_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
      end
  
      # 子カテゴリーが選択された後に動くアクション
      def get_category_grandchildren
        #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  
  
  
  
    def update
      user = User.find(@item.user_id)
      if user == current_user
        if @item.update(item_params)
          redirect_to root_path
        else
          redirect_to edit_item_path, flash: {editnotice:'更新失敗です。入力されていないか無効な値があります。'}
        end
      else
        redirect_to  unexpectederrors_path
      end
  
    end
  
  
  
  
  
    def destroy
      user = User.find(@item.user_id)
      if user == current_user
        if @item.destroy
          redirect_to root_path
        else
          redirect_to item_path(@item)
        end
      else
        redirect_to  unexpectederrors_path
      end
    end
  
    
  require 'payjp'

    def purchase
      
      @item = Item.find(params["item_id"])
      @item.sold = true
      @item.auction = false
      @item.save

      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
        amount: @item.price, # 決済する値段
        card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
        currency: 'jpy'
      )

      redirect_to action: :done
    end

    def done
      # 購入完了を表示するだけ
    end
    

  
    
  
    
    private
    def item_params
      params.require(:item).permit(:user_id, :address_id, :category_id, :parentcategory, :childcategory, :name, :price, :condition_id, :description, :size_id, :deliverycost_id, :deliveryway_id, :delivery_from, :deliverytime_id, :brand, :auction, :dealing, :sold, images_attributes: [:image])
    end
  
    def set_item
      @item = Item.find(params[:id])
    end
  
  end
  