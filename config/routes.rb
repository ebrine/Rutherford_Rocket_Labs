Rails.application.routes.draw do
  resources :employees, only: [:index, :new, :create]

  root :to => 'homes#show'
  
  #homepage routes
  get "/home", :to => "homes#show"

  # sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
