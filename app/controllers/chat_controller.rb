class ChatController < ApplicationController
  def read
    app = Chatapp.find_by(token: params[:token])
    if app.nil?
      render json: "Invalid Token"
    else
      chats = Chat.all.where(username: app[:username])
      if chats.nil?
        render json: "No chats founded"
      else
        render json: chats
      end
    end
  end

  def auth
    application = Chatapp.find_by(token: params[:token])
    !application.nil?
  end

  def create
    if auth

      chatCount = nil
      user_name = nil
      ActiveRecord::Base.transaction do
        chatApp = Chatapp.find_by(token: params[:token])
        chatApp.lock!
        chatApp[:chat_count] += 1
        chatCount = chatApp[:chat_count]
        user_name = chatApp[:username]
        chatApp.save!
      end

      if chatCount != nil
        row = Chat.create(username: user_name, name: params[:name], number: chatCount, message_count: 0)

        if row.save
          render json: {chatNumber: chatCount}, status: :created
        else
          render json: row.errors, status: :unprocessable_entity
        end
      end
    else
      render json: { body: 'application not founded' }, status: :not_found
    end
  end

  def update
    username = Chatapp.find_by(token: params[:token])[:username]

    unless username.nil?
      chat = nil
      ActiveRecord::Base.transaction do
        chat = Chat.find_by(username: username)
        unless chat.nil?
          chat.lock!
          chat[:name] = params[:name] unless params[:name].nil?
          chat.save!
        end
      end

      if chat.nil?
        render json: "Invalid keys of chat"
      else
        render json: chat
      end
    end
    render json: "invalid token"
  end


  private

  def chat_params
    params.require(:Chat).permit(:token, :password, :name)
  end
end
