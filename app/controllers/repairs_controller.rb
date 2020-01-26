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

end
