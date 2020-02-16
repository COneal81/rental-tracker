class TenantsController < ApplicationController  

    before_action :logged_in?, :set_tenant, :current_user

    def index
    #    binding.pry
    end

    def new 
        @tenant = Tenant.new
    end

    def create
         @tenant = current_user.tenants.build(tenant_params)
         if @tenant.save
            # binding.pry
            #Flash message here
            redirect_to tenant_path(@tenant)
       else
            #Flash error here
            render :new
       end
    end

    def show 
          #@rental_property = RentalProperty.find(params[:id]) 
         @tenant = Tenant.find(params[:id])
    end

    def edit
        @tenant = Tenant.find(params[:id])
        @tenant = current_user.rental_properties
    end

    def update
        @tenant = Tenant.find(params[:id])
        @tenant.update(repair_params)
        redirect_to tenant_path(@tenant)
    end

    def destroy
        @tenant = Tenant.find(params[:id])
        @tenant.destroy
        redirect_to tenants_path
    end
    private

    def tenant_params
        params.require(:tenant).permit(:renter, :co_renter, 
        :address, :renter_email, :co_renter_email, :renter_cell_phone, :co_renter_cell_phone)
    end

    def set_tenant
        @tenants = current_user.tenants
    end
    
end
