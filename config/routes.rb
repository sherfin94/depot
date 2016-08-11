Rails.application.routes.draw do
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'
  post 'sessions/create'

  get 'admin', to: 'admin#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #controller :sessions do
  #  get 'login' => :new
  #  post 'login' => :create
  #  delete 'logout' => :destroy
  #end

  get 'sessions/destroy'

  resources :users
  get 'store/index'
  resources :products

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store', via: :all
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'store#index', as: 'store'
end
