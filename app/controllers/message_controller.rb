class MessageController < ApplicationController
  def read
    app = Chatapp.find_by(token: params[:token])
    if app.nil?
      render json: 'Invalid Token'
    else
      messages = Message.find_by(username: app[:username], chat_number: params[:chat_number], number: params[:number])
      if messages.nil?
        render json: 'No chat founded'
      else
        render json: messages
      end
    end
  end

  def readall
    app = Chatapp.find_by(token: params[:token])
    if app.nil?
      render json: 'Invalid Token'
    else
      messages = Message.all.where(username: app[:username], chat_number: params[:chat_number])
      if messages.nil?
        render json: 'No chat founded'
      else
        render json: messages
      end
    end
  end

  def auth
    application = Chatapp.find_by(token: params[:token])
    if !application.nil?
      !Chat.find_by(number: params[:chat_number]).nil?
    else
      false
    end
  end

  def create
    if auth

      messageCount = nil
      chatApp = Chatapp.find_by(token: params[:token])
      user_name = chatApp[:username]
      ActiveRecord::Base.transaction do
        chat = Chat.find_by(username: user_name, number: params[:chat_number])
        chat.lock!
        chat[:message_count] += 1
        messageCount = chat[:message_count]
        chat.save!
      end

      if messageCount != nil
        row = Message.create(body: params[:body], username: user_name, number: messageCount, other: params[:other], chat_number: params[:chat_number])

        if row.save
          render json: {messageNumber: messageCount}, status: :created
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

    unless username.nil? && params[:chat_number].nil? && params[:number].nil?

      message = nil
      ActiveRecord::Base.transaction do
        message = Message.find_by(username: username, chat_number: params[:chat_number], number: params[:number])

        unless message.nil?
          message.lock!

          message[:other] = params[:other] unless params[:other].nil?
          message[:body] = params[:body] unless params[:body].nil?

          message.save!
        end
      end

      if message.nil?
        render json: 'Invalid keys of message'
      else
        render json: message
      end
    end
  end

  def search
    app = Chatapp.find_by(token: params[:token])
    if app.nil?
      render json: 'Invalid Token'
    else
      messages = Message.all.where(username: app[:username], chat_number: params[:chat_number])
      messages = messages.where("body like '%#{params[:body]}%'")
      if messages.nil?
        render json: 'No chat founded'
      else
        render json: messages
      end
    end
  end

  private

  def message_params
    params.require(:Message).permit(:token, :body, :other, :number, :chat_number)
  end
end
