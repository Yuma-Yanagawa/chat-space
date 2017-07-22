class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
  end

  def create
  end
end
