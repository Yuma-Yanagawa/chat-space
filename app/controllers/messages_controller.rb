class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new(message_params)
    @messages = @group.messages
    if @message.save
      redirect_to group_messages_path(@group), notice: "メッセージを送信しました"
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

   private
   def message_params
     params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
   end
end
