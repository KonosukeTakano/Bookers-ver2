Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  resources :books,only: [:new, :index, :show, :create]
  # resources :books
  
  get 'homes/about' => 'homes#about' ,as: 'about'
  # post 'books/:id' => 'books#create'   #ここを追記します
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
