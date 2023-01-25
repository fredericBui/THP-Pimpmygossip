Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get :register, to: "users#new"
  post :register, to: "users#create"
  get :register_success , to: "users#success"
  
  #improve gossip comments and like
  resources :gossips do
    resources :comments, except: :index
  end

  resources :sessions, only: [:new, :create]
  get :logout, to: "sessions#destroy"

  get "gossip/:gossip_id/comment/:id/like", to: "like#like_dislike_comment"
  get "gossip/:id/like/", to: "like#like_dislike"

  # Defines the root path route ("/")
  root "gossips#index"
end
