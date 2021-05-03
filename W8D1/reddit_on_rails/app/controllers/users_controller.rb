class UsersController < ApplicationController

    before_action :require_login, only: [:edit, :update, :destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def index
        @users = User.all
        render :index
    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user == current_user
            logout!
            @user.destroy
        else
            render :index
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        if @user == current_user
            render :edit
        else
            redirect_to users_url
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user && @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
