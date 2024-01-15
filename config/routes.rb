Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources 'quants'
  resources 'general_sciences'
  resources 'reasonings'
  
  # Defines the root path route ("/")
  root "contents#index"

  get '/redirect', to: 'contents#redirect', as: :url

end
