class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      redirect_to cats_url
    else
      debugger
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
