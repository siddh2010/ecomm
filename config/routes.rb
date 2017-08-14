Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :products
  resources :items
  resources :reviews
  #the below 3 lines are replaced with the above lines. 
  # get 'products/index'
  # get 'products/new'
  # get 'products/edit'
  root 'products#index'
  get 'home/about'
  get 'home/contact'
  get 'home/index'

  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
