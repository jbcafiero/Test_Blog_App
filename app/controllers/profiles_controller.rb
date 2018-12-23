class ProfilesController < ApplicationController
  def index
    @user = User.all
  end
  def show
    @user = User.find_by username: params[:username]
  end
  def edit
    @user = User.find_by username: params[:username]
    if @user.username == current_user.username
      @canedit = true
    else
      @canedit
    end
  end
  def update
    @user = User.find_by username: params[:username]
    @user.update(profile_params)
    redirect_to profile_path(params[:username])
  end
  private
  def profile_params
  params.require(:user).permit(:image, :username, :user_bio)
  end
end
