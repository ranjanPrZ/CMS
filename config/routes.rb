Rails.application.routes.draw do
  get 'data_imports/new'
  get 'data_imports/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources 'quants'
  resources 'general_sciences'
  resources 'reasonings'
  
  # Defines the root path route ("/")
  root "contents#index"

  get '/redirect', to: 'contents#redirect', as: :url

  # DataImport paths
  resources :data_imports, only: [:new, :create]
end
