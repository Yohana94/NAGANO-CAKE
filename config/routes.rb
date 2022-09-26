Rails.application.routes.draw do
  namespace :admin do
    patch '/order_details/:id', to: 'order_details#update', as: 'order_detail'
  end
  namespace :admin do
    resources :orders, only: [:show, :update,]
    # get '/admin/orders/:id', to: 'orders#show'
    # patch '/admin/orders/:id', to: 'orders#update'
  end
  namespace :admin do
    resources :customers, only: [:show, :update, :index, :edit]
    # get '/admin/customers', to: 'customers#index'
    # get '/admin/customers/:id', to: 'customers#show'
    # get '/admin/customers/:id/edit', to: 'customers#edit'
    # patch '/admin/customers/:id', to: 'customers#update'
  end
  namespace :admin do
    resources :genres, only: [:create, :update, :index, :edit]
    # get '/admin/genres', to: 'genres#index'
    # post '/admin/genres', to: 'genres#create'
    # get '/admin/genres/:id/edit', to: 'genres#edit'
    # patch '/admin/genres/:id', to: 'genres#update'
  end
  namespace :admin do
    resources :items, only: [:create, :show, :index, :update, :new, :edit]
    #action: :index, on: :collection
    #get '/admin/items', to: 'items#index'
    #get '/admin/items/new', to: 'items#new'
    #post '/admin/items', to: 'items#create'
    #get '/admin/items/:id', to: 'items#show'
    #get '/admin/items/:id/edit', to: 'items#edit'
    #patch '/admin/items/:id', to: 'items#update'
  end
  namespace :admin do
    get '/', to: 'homes#top', as: 'admin'
  end

  scope module: 'public' do
    resources :shipping_addresses, except: [:new, :show]
    #patch '/shipping_address/:id', to: 'shipping_address#update'
    #delete '/shipping_address/:id', to: 'shipping_address#detroy'
    #post '/shipping_address', to: 'shipping_address#create'
    #get '/shipping_address', to: 'shipping_address#index'
    #get '/shipping_address/:id/edit', to: 'shipping_address#edit'
  end

  scope module: 'public' do
    #get '/orders/new', to: 'orders#new'
    post '/orders/confirm', to: 'orders#confirm'
    get '/orders/thanks', to: 'orders#thanks'
    resources :orders, except: [:edit, :update]
    # post '/orders', to: 'orders#create'
    # get '/orders', to: 'orders#index'
    # get '/orders/:id', to: 'orders#show'
  end

  scope module: 'public' do
    get '/cart_items', to: 'cart_items#index'
    patch '/cart_items/:id', to: 'cart_items#update'
    delete '/cart_items/:id', to: 'cart_items#destroy', as: 'cart_item'
    delete '/cart_items', to: 'cart_items#all_destroy', as: 'all_destroy_cart_items'
    post '/cart_items', to: 'cart_items#create'
  end

  scope module: 'public' do
    get '/customers/edit', to: 'customers#edit'
    get '/customers', to: 'customers#show'
    get '/customers/quit', to: 'customers#quit'
    patch '/customers', to: 'customers#update'
    patch '/customers/out', to: 'customers#out'
  end

  scope module: 'public' do
    resources :items
  end

  # https://some-domain.com/
  scope module: 'public' do
    root "homes#top"
    get '/about', to: 'homes#about', as: "about"
  end
  # 管理者用
  # URL /admin/sign_in ...
#   devise_for :admins, controllers: {
#   sessions: "admin/sessions"
# }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 devise_for :admin, controllers: {
sessions: "admin/sessions"

}
end