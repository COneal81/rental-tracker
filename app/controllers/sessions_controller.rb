class SessionsController < ApplicationController
    helper_method :logged_in?, :current_user
    def home 
        render 'sessions/new'
    end
    
    def new 
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id 
            #place a flash message here
            redirect_to user_path(@user)
        else 
            #place flash message here
            render :new 
        end
    end

    
    
        
    def destroy
        if logged_in?
            session.clear
            redirect_to "/"
        else 
            redirect_back(fallback_location: root_path)
        end
    end

    private
    
    
    

end