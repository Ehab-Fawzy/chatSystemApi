Rails.application.routes.draw do
  get '/chatapp', to: 'chatapp#index'
  post '/chatapp/create', to: 'chatapp#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
