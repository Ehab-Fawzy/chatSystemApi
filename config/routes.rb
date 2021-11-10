Rails.application.routes.draw do
  get '/chatapp/read', to: 'chatapp#read'
  post '/chatapp/create', to: 'chatapp#create'

  get '/chat/read', to: 'chat#read'
  post '/chat/create', to: 'chat#create'

  get '/message/read', to: 'message#read'
  get '/message/read/all', to: 'message#readall'
  post '/message/create', to: 'message#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
