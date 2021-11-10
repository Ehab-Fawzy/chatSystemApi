class ChatappController < ApplicationController

  def read
    render json: Chatapp.find_by(token: params[:token])
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
      render json: {body: "application with the same username is exists"}, status: :unprocessable_entity
    elsif app.save
      render json: app, status: :created
    else
      render json: app.errors, status: :unprocessable_entity
    end

  end
  
  private

  def chatapp_params
    params.require(:Chatapp).permit(:username, :password, :name, :token)
  end

end
