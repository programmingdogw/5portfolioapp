class HomeController < ApplicationController

  def search
    @user = current_user
    @firstitems = Item.firstsearch(params[:firstsearch])
  
    
    @search = Item.ransack(params[:q])  #ransack
    @result = @search.result        #ransack

    @allparentcategories = Category.where(ancestry: nil)
    
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end



    @allsizes = Size.all
    @allconditions = Condition.all
    @alldeliverycosts = Deliverycost.all
    @alldeliveryways = Deliveryway.all
    @alldeliverytimes = Deliverytime.all
    @alldelivery_froms = Item.delivery_froms


    if params[:q].present?
      @hoge = "hoge"
    else
        params[:q] = { sorts: 'id desc' }
        @search = Item.ransack()
        @items = Item.all
    end


    

  end

  



  

  def index
    @items = Item.firstsearch(params[:search])
    @search = Item.ransack(params[:q])  #ransack
    @result = @search.result           #ransack

  
    @user = current_user
    
    @pickupitems = Item.includes(:images).last(6)
    @item1 = @pickupitems[0]
    @item2 = @pickupitems[1] 
    @item3 = @pickupitems[2]
    @item4 = @pickupitems[3]
    @item5 = @pickupitems[4]
    @item6 = @pickupitems[5]

    @ladiescategory = Category.find(1)
    @babykidscategory = Category.find(346)
    @bookstoysgamescategory = Category.find(625)
    
    #  不要と判断削除予定#リンクボックスの初期値設定
    #  @category_parent_array = ["---"]
    @category_parent_array = []

     #データベースから、親カテゴリーのみ抽出し、配列化
     Category.where(ancestry: nil).each do |parent|
       @category_parent_array << parent.name
     end
     
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

  
  def unexpectederrors
    # 予期せぬ動作が起きた場合に飛ぶページ用
    # エラーハンドリングの遷移先として置いてる
  end


end
