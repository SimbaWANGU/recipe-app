Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users
  delete 'recipes/:id', to: 'recipes#destroy'
  patch 'recipes/:id', to: 'recipes#update'
  get 'recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  post '/create_recipe', to: 'recipes#create'
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new'
  get '/recipes/:id', to: 'recipes#show', as: :recipe
  # Defines the root path route ("/")
  root to: 'recipes#public_recipes'
  get '/foods', to: 'food#index'
  get '/add_food', to: 'food#add'
  get '/public_recipes', to: 'recipes#public_recipes'
  post '/create_food', to: 'food#create'
  delete '/delete_food/:id', to: 'food#delete'

  get '/shopping_list/:id', to: 'recipes#shopping_list'
end
