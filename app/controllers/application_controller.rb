class ApplicationController < ActionController::Base

    #declaring these as helper methods so that it works in our views
    helper_method :current_user, :logged_in? 
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]       
    end
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
