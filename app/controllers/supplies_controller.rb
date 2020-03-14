class SuppliesController < ApplicationController
    before_action :current_user, :logged_in?, :set_rental_properties
    before_action :find_supply, only: [:show]
    

    def index
        @supplies = Supply.all
    end


    def new 
        @supply = Supply.new
    end


    def create
        @supply = Supply.find_or_create_by(supply_params)
        if @supply.valid?
            @supply.save
            flash.notice = "#{@supply.supply_name} was added."
            redirect_to supply_path(@supply)
        else 
            @user = current_user
            render :new
        end
    end


    def show
    end


    private

    def supply_params
        params.require(:supply).permit(:supply_name)
    end


    def set_supplies
        @supplies = current_user.supplies
    end


    def find_supply
        @supply = Supply.find(params[:id])
    end
    
end