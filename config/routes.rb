Rails.application.routes.draw do
  
  devise_for :users, controllers:  {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
  
  root to: 'homes#top'
  
  resources :users,only: [:index, :show, :edit]
  resources :books,only: [:new, :index, :show, :create, :edit]
  
  get 'homes/about' => 'homes#about' ,as: 'about'
  patch 'users/:id' => 'users#update', as: 'update_user'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
