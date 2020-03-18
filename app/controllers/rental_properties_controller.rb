class RentalPropertiesController < ApplicationController
    before_action :current_user, :logged_in?, :require_login, :set_rental_properties
    before_action :find_rental_property, only: [:show, :edit, :update, :destroy]

    def index
        if @rental_properties.empty?
            flash.alert = "No Properties Found"
        end
    end


    def available_properties
        @rental_properties = RentalProperty.available_properties(current_user)
            if @rental_properties.empty?
                flash.alert = "You currently do not have any properties available to be leased."
            end
    end


    def affordable_available_properties
        @rental_properties = RentalProperty.affordable_available_properties(current_user)
            if @rental_properties.empty?
                flash.alert = "You currently do not have any properties available to be leased."
            end
    end 


    def new
         @rental_property = RentalProperty.new
          @user = current_user
    end


    def create
        @rental_property = RentalProperty.new(rental_property_params)
        if @rental_property.valid?
            @rental_property.save
    
            flash.notice = "#{@rental_property.property_name} was added."
            redirect_to user_rental_property_path(@rental_property.user.id, @rental_property)
        else 
            @user = current_user
            render :new
        end
    end
   
    
    def show 
    end


    def edit 
        @user = current_user
    end


    def update
        @rental_property.update(rental_property_params)
        if @rental_property.save 
            flash.notice = "Rental Property, #{@rental_property.property_name} updated."
            redirect_to rental_property_path(@rental_property)
        else
            render :edit
        end
    end


    def destroy
        @rental_property.destroy
        flash.notice = "#{@rental_property.property_name} was deleted from your property list."
        redirect_to rental_properties_path
    end


    private

    def rental_property_params
        params.require(:rental_property).permit(:property_name, 
                                                :property_description, 
                                                :address, 
                                                :monthly_rental_amount,
                                                :deposit_amount, 
                                                :square_feet, 
                                                :contract_start_date, 
                                                :contract_end_date, 
                                                :img_url, 
                                                :leased, 
                                                :user_id, 
                                                :tenant_id) 
                                                
    end

    def find_rental_property
        @rental_property = RentalProperty.find(params[:id])
    end
end
