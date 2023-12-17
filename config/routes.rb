Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'

devise_for :users
 
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:index, :show, :edit, :update]
 
root to: 'homes#top'
 
get 'about', to: 'homes#about', as: 'about'
end
