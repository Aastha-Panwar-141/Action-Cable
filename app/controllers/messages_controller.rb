class MessagesController < ApplicationController
  # def create
  #   message = Message.new(message_params)
  #   message.user = current_user
  #   if message.save
  #     # do some stuff
  #     redirect_to message, notice: "Message saved."

  #   else 
  #     redirect_to chatrooms_path
  #   end
  # end

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username
      head :ok
    end
  end


  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end

end
