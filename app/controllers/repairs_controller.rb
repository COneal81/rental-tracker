class RepairsController < ApplicationController
    before_action :logged_in?, :set_repair, :set_rental_properties

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

    def index_open_ticket_repairs
    end

    def new 
        @repair = Repair.new
        @rental_property = current_user.rental_properties
    end

    def create
        
       @repair = Repair.new(repair_params)
        if @repair.valid?
            @repair.save
            flash.notice = "#{@repair.repair_name} was added."
            redirect_to repair_path(@repair)
       else
            flash.alert = "* Fields must be filled in to create a new repair."
            render :new
       end
    end

    def show 
        @repair = Repair.find(params[:id])
    end

    def edit
        @repair = Repair.find(params[:id])
        @rental_property = current_user.rental_properties
    end

    def update
        @repair = Repair.find(params[:id])
        @repair.update(repair_params)
        flash.notice = "#{@repair.repair_name} was updated."
        redirect_to repair_path(@repair)
    end

    def destroy
        @repair = Repair.find(params[:id])
        @repair.destroy
        flash.notice = "#{@repair.repair_name} was deleted from your repair list."
        redirect_to repairs_path
    end

    private

    def repair_params
        params.require(:repair).permit(:repair_name, :repair_needed, 
        :repair_description, :repair_cost, :repair_completed, :rental_property_id)
    end

    def set_repair
        @repairs = current_user.repairs
    end

end
