class RepairsController < ApplicationController
    before_action :logged_in?, :set_repair, :set_rental_properties

    def index
        @user = current_user
    end

    def index_property
        @repairs = Repair.where("rental_property_id = ?", params[:rental_property_id])
    end

    def index_open_ticket_repairs
        @repairs = Repair.where("repair_completed = false", params[:repair_completed])
    end

    def new 
        @repair = Repair.new
        @rental_property = current_user.rental_properties
    end

    def create
        
       if @repair = Repair.create(repair_params)
            #Flash message here
            redirect_to repair_path(@repair)
       else
            #Flash error here
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
        redirect_to repair_path(@repair)
    end

    def destroy
        @repair = Repair.find(params[:id])
        @repair.destroy
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
