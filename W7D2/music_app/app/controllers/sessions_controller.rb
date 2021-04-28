class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email],params[:user][:password])
        if user
            login!(user)
            redirect_to user_url(user)
        else
            redirect_to bands_url
        end
    end

    def destroy
        if current_user
            log_out!
            redirect_to bands_url
        else
            redirect_to new_session_url
        end
    end
end
