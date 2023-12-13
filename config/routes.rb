Rails.application.routes.draw do
devise_for :users
 
resources :books, only: [:new, :index, :show]
 
root to: 'homes#top'
 
 
end
