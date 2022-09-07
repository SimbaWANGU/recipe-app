Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/food', to: 'food#index'
  delete '/delete_food/:id', to: 'food#delete'
end
