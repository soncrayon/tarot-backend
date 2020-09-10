Rails.application.routes.draw do
  
          resources :cards
          resources :readings
          resources :users

          post '/login', to: 'sessions#create'
          delete '/logout', to: 'sessions#destroy'
          get '/logged_in', to: 'sessions#is_logged_in?'

          get '/loggedin_user_readings/:id', to: 'readings#show_loggedin_user_readings'
          
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
