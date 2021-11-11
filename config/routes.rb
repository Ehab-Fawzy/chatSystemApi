Rails.application.routes.draw do
  get '/chatapp/read', to: 'chatapp#read'
  post '/chatapp/create', to: 'chatapp#create'
  patch '/chatapp/update', to: 'chatapp#update'

  get '/chat/read', to: 'chat#read'
  post '/chat/create', to: 'chat#create'
  patch '/chat/update', to: 'chat#update'

  get '/message/read', to: 'message#read'
  get '/message/read/all', to: 'message#readall'
  post '/message/create', to: 'message#create'
  patch '/message/update', to: 'message#update'

  get '/message/search', to: 'message#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
