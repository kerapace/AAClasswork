class ApplicationController < ActionController::Base

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in? 
        @current_user ||= current_user
        !!@current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user 
    end

    def logout!
        @current_user.reset_session_token!
        @current_user = nil
        session[:session_token]
    end

    def require_login 
        redirect_to new_session_url unless logged_in?
    end

    def require_logout
        redirect_to users_url if logged_in? 
    end
end
