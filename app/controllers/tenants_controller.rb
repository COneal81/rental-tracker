class TenantsController < ApplicationController  

    before_action :logged_in?

    def index
        @tenant = Tenant.all 
    end

    def new 
        @tenant = Tenant.new
        @rental_property = current_user.rental_properties
    end

    def create
       if @tenant = Tenant.create!(tenant_params)
      
            #Flash message here
            redirect_to tenant_path(@tenant)
       else
            #Flash error here
            render :new
       end
    end

    def show 
        @tenant = Tenant.find(params[:id])
        @rental_property = current_user.tenants
    end

    private

    def tenant_params
        params.require(:tenant).permit(:renter, :co_renter, 
        :address, :renter_email, :co_renter_email, :renter_cell_phone, :co_renter_cell_phone)
    end
end
