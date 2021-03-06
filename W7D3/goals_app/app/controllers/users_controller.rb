class UsersController < ApplicationController
    # before_action :require_login, only: [:index, :show]
    # before_action :require_logout, only: [:new, :create]

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            login!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end
