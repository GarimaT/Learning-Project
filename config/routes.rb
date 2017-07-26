Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get '/about', to: 'pages#about'

resources :articles

get '/signup', to: 'users#new_user'

get '/login', to: 'sessions#new'

post '/login', to: 'sessions#create'

delete '/logout', to: 'sessions#destroy'

get '/article/update_status', to: 'articles#update_status'

resources :users
end

