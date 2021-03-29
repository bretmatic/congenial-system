Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json } do
  	post "users/login", to: "users#login"
  	resources :users
  	resources :posts
  end

  root to: 'pages#home'

end
