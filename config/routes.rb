Rails.application.routes.draw do
  # get '/contents', 'contents#index'
  # get 'contents/new', 'contents#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources 'quants'
  # Defines the root path route ("/")
  # root "articles#index"
end
