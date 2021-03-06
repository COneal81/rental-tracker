class ApplicationController < ActionController::Base
   
    helper_method :current_user, :logged_in?, :set_rental_properties

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
    
    def set_rental_properties
        @rental_properties = current_user.rental_properties
    end

    def require_login
        unless logged_in?
            flash[:alert] = "Please login to view this page."
            redirect_to root_path
        end
    end
    
end
