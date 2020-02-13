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

    def create_google
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        
        user = User.from_omniauth(access_token)
        # binding.pry
        log_in(user)
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        user.save
        redirect_to user_rental_property_path
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
    def auth
        request.env['omniauth.auth']
      end
    

end