require 'byebug'

class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            login!(user)
            redirect_to bands_url
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    def destroy
        user = User.find_by_credentials(params[:user][:email],params[:user][:password])
        if current_user == user
            log_out!
        end
        if user && user.destroy
            redirect_to "/"
        elsif user
            redirect_to user_url(user)
        else
            redirect_to "/"
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            redirect_to "/"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email,:password)
    end
end
