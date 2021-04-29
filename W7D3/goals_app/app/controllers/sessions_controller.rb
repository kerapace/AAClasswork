class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username],params[:user][:password])
        if user
            login!(user)
            redirect_to user_url(user)
        else
            flash[:errors] << "Invalid login, try again"
            redirect_to new_session_url
        end
    end

    def destroy
        if current_user
            logout!
            redirect_to users_url
        else
            redirect_to new_session_url
        end
    end
end
