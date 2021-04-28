class SessionsController < ApplicationController
  def new
    if !logged_in?
      render :new
    else
      redirect_to user_url(current_user)
    end
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
