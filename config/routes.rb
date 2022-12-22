Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get :register, to: "register#index"
  post :register, to: "register#create_user"
  get :register_success , to: "register#success"
  get :login, to: "login#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
