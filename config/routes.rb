Rails.application.routes.draw do
  get '/ingredients', to: 'ingredients#index'
  get '/ingredients/:id', to: 'ingredients#show'

  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show'
end
