Project2::Application.routes.draw do

root :to => 'events#index'

resources :users, only: [:new, :create, :edit, :update, :destroy]
resources :sessions, only: [:new, :create, :destroy]

match '/auth/twitter/callback' => 'sessions#create'

match '/signup' => 'users#new'
match '/signin' => 'sessions#new'
match '/signout' => 'sessions#destroy'
end
