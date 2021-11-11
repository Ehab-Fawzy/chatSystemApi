class ChatappController < ApplicationController

  def read
    app = Chatapp.where(token: params[:token])
    app = app.select('name', 'username', 'chat_count', 'token', 'created_at', 'updated_at')
    render json: app
  end

  def create
    payload = {username: params[:username], password: params[:password]}
    _token = JWT.encode(payload, Rails.application.credentials.secret_key_base);

    app = nil
    ActiveRecord::Base.transaction do
      if Chatapp.where(username: params[:username]).exists?
        app = nil
      else
        app = Chatapp.create(username: params[:username], password: params[:password], name: params[:name], token: _token, chat_count: 0)
      end
    end

    if app == nil
      render json: {body: 'application with the same username is exists'}, status: :unprocessable_entity
    elsif app.save
      app[:id] = -1
      render json: app, status: :created
    else
      render json: app.errors, status: :unprocessable_entity
    end

  end

  def update
    app = nil
    ActiveRecord::Base.transaction do
      app = Chatapp.find_by(token: params[:token])
      unless app.nil?
        app.lock!
        app[:name] = params[:name] unless params[:name].nil?
        app[:password] = params[:password] unless params[:password].nil?

        app.save!
      end
    end
    app[:id] = -1
    render json: app
  end
  
  private

  def chatapp_params
    params.require(:Chatapp).permit(:username, :password, :name, :token)
  end
end
