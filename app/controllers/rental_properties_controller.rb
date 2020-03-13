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
        #  @new_tenant = Tenant.new
          @user = current_user
        #  binding.pry
    end

    def create
        # @new_tenant = Tenant.find_or_create_by(tenant_params)
        
        # binding.pry
        @rental_property = RentalProperty.new(rental_property_params)
        #  @rental_property = RentalProperty.new(params[:property_name], params[:property_description], 
        #     params[:address], params[:monthly_rental_amount], params[:deposit_amount],
        #      params[:square_feet], params[:contract_start_date], params[:contract_end_date], 
        #     params[:image_url], params[:leased], params[:user_id], tenant_id: @new_tenant.id)

        # @rental_property = RentalProperty.new(rental_property_params)
         binding.pry
        if @rental_property.valid?
            @rental_property.save
            
            flash.notice = "#{@rental_property.property_name} was added."
            redirect_to rental_property_path(@rental_property)
        else 
            @user = current_user
            render :new
        end
    end
   
    
   

    def show 
       
        @rental_property = RentalProperty.find(params[:id])
        # @tenant = Tenant.find(params[:id])
        # binding.pry
        
    end

    def edit
        
        @rental_property = RentalProperty.find(params[:id])
        # @new_tenant = Tenant.find(params[:id])
        @user = current_user
        # binding.pry
    end

    def update
        @rental_property = RentalProperty.find(params[:id])
        @rental_property.update(rental_property_params)
        # @new_tenant = Tenant.find(params[:id])
        # @new_tenant.update(tenant_params)
        if @rental_property.save 
            # && @new_tenant.save
            flash.notice = "Rental Property, #{@rental_property.property_name} updated."
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

    # def tenant_params
    #     params.require(:rental_property) 
    #     .require(:tenant).permit(:renter, 
    #                                    :co_renter, 
    #                                    :address, 
    #                                    :renter_email, 
    #                                    :co_renter_email, 
    #                                    :renter_cell_phone, 
    #                                    :co_renter_cell_phone)
    # end

end
