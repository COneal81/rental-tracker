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
        @supply = Supply.find(params[:id])
        @user = current_user
    end

    def update
        @supply = Supply.find(params[:id])
        @supply.update(supply_params)
        if @supply.save 
            flash.notice = "#{@supply.supply_name} was updated."
            redirect_to supply_path(@supply)
        else 
            render :edit
        end
    end

    def destroy
        @supply = Supply.find(params[:id])
        @supply.destroy
        flash.notice = "#{@supply.supply_name} was deleted from your supply list."
        redirect_to supplies_path
    end

    private

    def supply_params
        params.require(:supply).permit(:supply_name, :user_id, :repair_id)
    end


end