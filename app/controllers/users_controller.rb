class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            #place a flash message here
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show 
        @user = User.find_by(id: session[:user_id])
    end

    
    private

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_conformation)
    end

end
