Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/foods', to: 'food#index'
  get '/add_food', to: 'food#add'
  get '/public_recipes', to: 'recipes#public_recipes'
  post '/create_food', to: 'food#create'
  delete '/delete_food/:id', to: 'food#delete'
end
