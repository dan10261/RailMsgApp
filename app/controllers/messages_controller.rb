class MessagesController < ApplicationController
    before_action :require_user
	  def create
	   # debugger
      #message = Message.new(message_params)
      #message.user_id = current_user.id
	    message = current_user.messages.build(message_params)
      if message.save
        #redirect_to root_path
        ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
      end
    end
    
    private
    def message_params
      params.require(:message).permit(:body)
    end
    
    def message_render(msg)
    render(partial: 'message',locals: {message: msg}) #render an html message partial
    end
end
