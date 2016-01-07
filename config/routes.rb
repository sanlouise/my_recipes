Rails.application.routes.draw do
  
# Home routes  
  root 'pages#home'
  get '/home', to: 'pages#home' 
  
# Recipe routes
  # get '/recipes', to: 'recipes#index' 
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # post '/recipes', to: 'recipes#create' 
  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id', to: 'recipes#update' 
  # get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  # delete '/recipes/:id', to: 'recipes#destroy'
  
  
  
   resources :recipes
   
   resources :chefs, except: [:new, :destroy]
   
   get '/register', to: 'chefs#new'
   
   get '/login', to: 'logins#new'
   post '/login', to: 'logins#create'
   get '/logout', to: 'logins#destroy'
   
   get '/contact', to: 'pages#contact' 
   get '/about', to: 'pages#about' 
   
   resources :styles, only: [:new, :create, :show]
   resources :ingredients, only: [:new, :create, :show]
   
end
