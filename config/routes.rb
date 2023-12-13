Rails.application.routes.draw do
devise_for :users
 
resources :books, only: [:new, :create, :index, :show]
 
root to: 'homes#top'
 
 
end
