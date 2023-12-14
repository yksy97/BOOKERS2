Rails.application.routes.draw do
devise_for :users
 
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 
root to: 'homes#top'
 
get 'about', to: 'homes#about', as: 'about'
end
