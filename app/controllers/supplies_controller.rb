class SuppliesController < ApplicationController
    before_action :current_user, :logged_in?, :set_rental_properties
    def index
        @supplies = Supply.all
    end

    def new 
        @supply = Supply.new
        @user = current_user
    end

    def create
        @supply = Supply.new(supply_params)
        binding.pry
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
        @supply = Supply.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def supply_params
        params.require(:supply).permit(:supply_name, :user_id, :repair_id)
    end


end