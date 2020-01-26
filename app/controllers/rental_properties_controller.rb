class RentalPropertiesController < ApplicationController

    def index
        @rental_properties = RentalProperty.all 
    end

    def new 
        @rental_property = RentalProperty.new
    end

    def create
        if @rental_property = RentalProperty.create(rental_property_params)
         
            #Flash message here
            redirect_to rental_property_path(@rental_property)
        else 
            #flash message here
            render :new
        end
    end

    def show 
        @rental_property = RentalProperty.find(params[:id])
    end

    def edit
    end

    def update
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.update(rental_property_params)
        redirect_to rental_property_path(@rental_property)
    end

    def destroy
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.destroy
    end

    private

    def rental_property_params
        params.require(:rental_property).permit(:property_name, :property_description, :address, :monthly_rental_amount,
        :deposit_amount, :square_feet, :contract_start_date, :contract_end_date, :img_url, :leased)
    end

end
