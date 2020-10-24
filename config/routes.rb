Rails.application.routes.draw do
  
          resources :cards
          resources :readings
          resources :users

          post '/login', to: 'sessions#create'
          delete '/logout', to: 'sessions#destroy'
          get '/logged_in', to: 'sessions#is_logged_in?'

          get '/loggedin_user_readings/:id', to: 'readings#show_loggedin_user_readings'

          get '/user_arcana_percentages/:id', to: 'users#user_arcana_percentages'
          get '/user_orientation_percentages/:id', to: 'users#user_orientation_percentages'
          get '/all_arcana_percentages', to: 'users#all_arcana_percentages'
          get '/all_orientation_percentages', to: 'users#all_orientation_percentages'
          get '/user_highest_arcana_percentage/:id', to: 'users#user_highest_arcana_percentage'
          get '/user_highest_orientation_percentage/:id', to: 'users#user_highest_orientation_percentage'
          get '/all_highest_arcana_percentage', to: 'users#all_highest_arcana_percentage'
          get '/all_highest_orientation_percentage', to: 'users#all_highest_orientation_percentage'





          
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
