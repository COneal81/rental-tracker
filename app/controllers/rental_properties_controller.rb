class RentalPropertiesController < ApplicationController
    before_action :current_user, :logged_in?, :set_rental_properties

    def index
        if @rental_properties.empty?
            flash.alert = "No Properties Found"
        end
    end

    def available_properties
            @rental_properties = current_user.rental_properties.where("leased = false", params[:leased])
            if @rental_properties.empty?
                flash.alert = "You currently do not have any properties available to be leased."
            end
    end

    def new
         @rental_property = RentalProperty.new
         @user = current_user
        #  binding.pry
    end

    def create
        @rental_property = RentalProperty.new(rental_property_params)
        if @rental_property.valid?
            @rental_property.save
            binding.pry
            flash.notice = "#{@rental_property.property_name} was added."
            redirect_to rental_property_path(@rental_property)
        else 
            @user = current_user
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
        @user = current_user
    end

    def update
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.update(rental_property_params)
        if @rental_property.save
            flash.notice = "#{@rental_property.property_name} was updated."
            redirect_to rental_property_path(@rental_property)
        else
            render :edit
        end
    end

    def destroy
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.destroy
        flash.notice = "#{@rental_property.property_name} was deleted from your property list."
        redirect_to rental_properties_path
    end

    private

    def rental_property_params
        params.require(:rental_property).permit(:property_name, :property_description, :address, :monthly_rental_amount,
        :deposit_amount, :square_feet, :contract_start_date, :contract_end_date, :img_url, :leased, :user_id, :tenant_id)
    end

    

end
