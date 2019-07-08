class ChatroomsController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all.order(:created_at).last(5)
    #@messages = Message.custom_display #this method is defined in Message model
    @message = Message.new
  end
end