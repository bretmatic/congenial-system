Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json } do
  	post "users/login", to: "users#login"
  	resources :users do
  		resources :posts
  	end
  	resources :posts do
  		get "expanded" , to: "posts#expanded"
  	end
  end

  root to: 'pages#home'

end
