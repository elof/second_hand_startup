Project2::Application.routes.draw do

root :to => 'events#index'

resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :events
resources :comments, :only => [:create, :destroy]

match 'auth/:provider/callback' => 'sessions#create'

post '/events/create_rsvp/:event_id' => 'events#create_rsvp'

match '/signup' => 'users#new'
match '/signin' => 'sessions#new'
match '/signout' => 'sessions#destroy'

end
