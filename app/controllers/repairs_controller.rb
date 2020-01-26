class RepairsController < ApplicationController
    
    def index
        @repairs = Repair.all 
    end

    def new 
        @repair = Repair.new
        @rental_properties = RentalProperty.pluck(:property_name, :id)
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
        :repair_description, :repair_cost, :repair_completed)
    end

end
