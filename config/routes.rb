Rails.application.routes.draw do
 

  

  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'

    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  

  resources :users, except: [:index, :new] 
  
  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }      
    end

    get 'images/destroy'
    
  end
  

  
 

  resources :home, only: [:index] 
  get 'unexpectederrors', to: 'home#unexpectederrors'
  root 'home#index'
  get 'search', to: 'home#search'
  


  # homeコントローラーのajax通信
  get 'get_category_children', to: 'home#get_category_children'
  get 'get_category_grandchildren', to: 'home#get_category_grandchildren'
  
  resources :categories, only: [:index, :show]
end
