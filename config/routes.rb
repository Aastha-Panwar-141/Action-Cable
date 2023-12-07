Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/show'
  devise_for :users
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"
  root to: "chatrooms#index"

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  # resources :chatrooms
  resources :messages
  
end
