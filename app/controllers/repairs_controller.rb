class RepairsController < ApplicationController

    before_action :logged_in?, :set_repair, :set_rental_properties

    def index
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

    private

    def repair_params
        params.require(:repair).permit(:repair_name, :repair_needed, 
        :repair_description, :repair_cost, :repair_completed, :rental_property_id)
    end

    def set_repair
        @repairs = current_user.repairs
    end

end
