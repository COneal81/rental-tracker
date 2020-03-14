class SessionsController < ApplicationController
    helper_method :logged_in?

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
            flash.notice = "Signed in sucessfully as #{@user.name}"
            redirect_to user_path(@user)
        else 
            flash.alert = "Invalid Email or Password.  Please try again."
            render :new 
        end
    end


    def destroy
        if logged_in?
            session.clear
            flash.notice = "Signed out sucessfully."
            redirect_to "/"
        else 
            redirect_back(fallback_location: root_path)
        end
    end


    private

end