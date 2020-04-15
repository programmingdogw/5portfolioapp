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
  

  
 

  resources :experiment, only: [:index, :sample] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  
  get 'unexpectederrors', to: 'experiment#unexpectederrors'
  root 'home#index'

end
