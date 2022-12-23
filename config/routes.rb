Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get :register, to: "register#index"
  post :register, to: "register#create_user"
  get :register_success , to: "register#success"
  get :login, to: "login#index"
  post :login, to: "login#connect"
  get :gossips, to: "gossips#index"
  get :gossip_new, to: "gossips#new"
  post :gossip_new, to: "gossips#create"
  get "gossip/:id", to: "gossips#view"
  get "gossip/edit/:id", to: "gossips#edit"
  put "gossip/edit/:id", to: "gossips#update"
  get "gossip/like/:id", to: "like#like_dislike"
  delete "gossip/:id", to: "gossips#delete"
  get "gossip/:id/comment/new", to: "comment#new"
  post "gossip/:id/comment/new", to: "comment#create"
  get "gossip/comment/like/:id", to: "like#like_dislike_comment"
  get "gossip/comment/edit/:id", to: "comment#edit"
  put "gossip/comment/edit/:id", to: "comment#update"
  delete "gossip/comment/edit/:id", to: "comment#delete"
  get "gossip/comment/:id", to: "comment#index"
  get :logout, to: "logout#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
