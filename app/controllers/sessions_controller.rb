class SessionsController < ApplicationController
    def home 
        render 'sessions/new'
    end
    
    def new 
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
    

end