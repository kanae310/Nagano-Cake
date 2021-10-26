Rails.application.routes.draw do
  devise_for :admins, controllers: {
     registrations: 'admins/registrations',
     sessions: "admins/sessions",
  }
  devise_for :end_users
  
  root to: 'public/homes#top'
  get "/about" => 'public/homes#about'
  namespace :public do
    resources :items,only: [:index,:show]
    resources :addreses,only: [:index,:create]
    # resources :orders,only: [:new,:create,:index,:show]
    post 'orders/confirm' => 'orders#confirm',as: 'orders_confirm'
    get 'orders/complete' => 'orders#complete',as: 'complete_order'
    resources :orders,only: [:new,:create,:index,:show]
    resources :cart_items, only: [:index,:update,:destroy,:create]
    delete 'cart_items' => 'cart_items#all_destroy', as: 'cart_items_all'
    resource :end_users,only: [:show,:edit,:update]
    get 'end_users/quit' => 'end_users#quit', as: 'quit_end_users'
    patch 'end_users/status_update' => 'end_users#status_update', as: 'status_update_end_users'
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :end_users,only: [:index,:show,:edit,:update]
    resources :items
    get 'search' => 'items#search', as: 'search'
    resources :genres,only: [:index,:create,:edit,:update]
    resources :orders,only:[:index,:show,:update]
    patch 'orders/:id/status_update' => 'orders#status_update',as: 'status_update_order'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
