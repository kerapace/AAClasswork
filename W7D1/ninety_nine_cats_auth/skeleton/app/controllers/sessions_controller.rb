class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    u = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if u
      login(u)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
