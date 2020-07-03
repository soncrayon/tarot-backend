Rails.application.routes.draw do
  
  namespace do :api 
    namespace do :v1
      resources :readings
      resources :cards
      resources :users
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
