class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    @users_sp = User.where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end


  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
   params.require(:user).permit(:name, :email)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
