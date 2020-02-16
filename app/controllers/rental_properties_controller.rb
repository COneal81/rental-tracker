class RentalPropertiesController < ApplicationController
    before_action :current_user, :logged_in?, :set_rental_properties

    def index
    end

    def available_properties
            @rental_properties = current_user.rental_properties.where("leased = false", params[:leased])
            # binding.pry
            # @rental_properties = RentalProperty.where("leased = false", params[:leased])
            #binding.pry 
    end

    def new
        @rental_property = RentalProperty.new
        @tenant = current_user.tenants
        #binding.pry
    end

    def create
        @rental_property = RentalProperty.new(rental_property_params)
        @tenant = Tenant.find(@rental_property.tenant_id)
        if @rental_property.valid?
            rental_property.save
    
            #Flash message here
            redirect_to user_rental_property_path(@rental_property.user, @rental_property)
        else 
            #flash message here
            render :new
        end
    end

    def show 
        
        @rental_property = RentalProperty.find(params[:id])
        # binding.pry
    end

    def edit
        @rental_property = RentalProperty.find(params[:id])
        @tenant = current_user.tenants
    end

    def update
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.update(rental_property_params)
        redirect_to rental_property_path(@rental_property)
    end

    def destroy
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.destroy
        redirect_to rental_properties_path
    end

    private

    def rental_property_params
        params.require(:rental_property).permit(:property_name, :property_description, :address, :monthly_rental_amount,
        :deposit_amount, :square_feet, :contract_start_date, :contract_end_date, :img_url, :leased, :user_id, :tenant_id)
    end

    

end
