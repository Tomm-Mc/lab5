Rails.application.routes.draw do
  resources :monsters

  # Ejercicio 2 y 8
  resources :tweets, except: [:edit, :update]  

 # root "monsters#index"

 # Ejercicio 4
  root "tweets#index"

end