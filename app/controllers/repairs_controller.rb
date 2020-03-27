class RepairsController < ApplicationController
    before_action :current_user, :logged_in?, :require_login, :set_repair, :set_rental_properties
    before_action :find_repair, only: [:show, :edit, :update, :destroy]

    def index
        if @repairs.empty?
            flash.alert = "No Repairs Found"
        end
    end


    def index_property
        @repairs = Repair.where("rental_property_id = ?", params[:rental_property_id])
        if @repairs.empty?
            flash.alert = "No Repairs Found"
        end
    end


    def open_ticket_repairs
    end


    def new 
        @repair = Repair.new
        @rental_property = current_user.rental_properties
        @supplies = current_user.supplies
    end


    def create
       @repair = Repair.new(repair_params)
        if @repair.valid?
            @repair.save
            flash.notice = "#{@repair.repair_name} was added."
            redirect_to repair_path(@repair)
       else
            @rental_property = current_user.rental_properties
            render :new
       end
    end


    def show 
    end


    def edit
        @rental_property = current_user.rental_properties
    end


    def update
        @repair.update(repair_params)
        if @repair.save
            flash.notice = "#{@repair.repair_name} was updated."
            redirect_to repair_path(@repair)
        else
            render :edit
        end
    end


    def destroy
        @repair.destroy
        flash.notice = "#{@repair.repair_name} was deleted from your repair list."
        redirect_to repairs_path
    end



    private

    def repair_params
        params.require(:repair).permit(:repair_name, :repair_needed, 
        :repair_description, :repair_cost, :repair_completed, :rental_property_id, supply_ids:[], 
        supplies_attributes: [:supply_name])
    end


    def set_repair
        @repairs = current_user.repairs
    end


    def find_repair
        @repair = Repair.find(params[:id])
    end

end
