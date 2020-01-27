class TenantsController < ApplicationController  
    def index
        @tenant = Tenant.all 
    end

    def new 
        @tenant = Tenant.new
        @rental_properties = RentalProperty.pluck(:property_name, :id)
    end

    def create
       if @tenantr = Tenant.create(repair_params)
      
            #Flash message here
            redirect_to tenant_path(@tenant)
       else
            #Flash error here
            render :new
       end
    end

    def show 
        @tenant = Tenant.find_by(id: params[:id])
        @rental_property = RentalProperty.find_by(id: params[:id])
    end

    private

    def repair_params
        params.require(:tenant).permit(:renter, :co_renter, 
        :address, :renter_email, :co_renter_email, :renter_cell_phone, :co_renter_cell_phone)
    end
end
