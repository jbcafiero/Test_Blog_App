class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    useremail = User.find_by_email(user.email)
    userpw = User.find_by_password_digest(user.password_digest)
    if useremail && userpw
      session[:user_id] = useremail.id
      redirect_to articles_path
    else
      redirect_to login_path
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to home_path
  end

  private
  def user_params
  params.require(:user).permit(:username, :email, :password_digest)
  end

end
