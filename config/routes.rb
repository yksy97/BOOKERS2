Rails.application.routes.draw do

devise_for :users
 
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:index, :show, :edit, :update]
 
root to: 'homes#top'
 
 get 'home/about', to: 'homes#about', as: 'about'


end
