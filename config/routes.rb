Rails.application.routes.draw do

  get "search" => "searches#search", as: 'search'
  
  devise_for :users, controllers:  {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root to: 'home#top'

  resources :users,only: [:index, :show, :edit]
  resources :books,only: [:new, :index, :show, :create, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get 'home/about' => 'home#about' ,as: 'about'
  patch 'users/:id' => 'users#update', as: 'update_user'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
