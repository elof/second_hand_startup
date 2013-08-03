Project2::Application.routes.draw do

resources :users
resources :sessions, only: [:new, :create, :destroy]
root :to => 'events#index'

get '/signup' => 'users#new'
get '/signin' => 'sessions#new'
get '/signout' => 'sessions#destroy'
end
