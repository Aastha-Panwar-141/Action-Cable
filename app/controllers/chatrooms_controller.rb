class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/users/sign_in' unless @current_user
    @rooms = Chatroom.all
    @users = User.all
  end

  def show
    byebug

    # @chatroom = Chatroom.find(params[:id])
    @chatroom = Chatroom.find_by(slug: params[:slug])
    # @chatroom = Chatroom.all
    @message = Message.new
  end
end
