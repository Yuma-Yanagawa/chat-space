class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to messages_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
    @group = Group.find(1)
  end

  def update
    group = Group.find(1)
    group.update(group_params)
    redirect_to messages_path
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
