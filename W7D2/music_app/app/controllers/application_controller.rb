class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    protect_from_forgery with: :exception
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_login
        unless logged_in?
            redirect_to new_session_url
        end
    end

    def require_log_out
        if logged_in?
            redirect_to bands_url
        end
    end

    def login!(user)
        @current_user = user
        session[:session_token] = @current_user.reset_session_token!
    end

    def log_out!
        @current_user.reset_session_token!
        @current_user = nil
    end

    def logged_in?
        @current_user ||= current_user
        !!@current_user
    end
end
