class TenantsController < ApplicationController  

    before_action :current_user, :logged_in?, :set_tenant, :set_rental_properties

    def index
        # @tenants = Tenant.all
        if @tenants.empty?
            flash.alert = "No Tenants Found"
        end
    end

    def new 
        @tenant = Tenant.new
    end

    def create
         @tenant = Tenant.new(tenant_params)
         if @tenant.valid?
            @tenant.save
             #binding.pry
            flash.notice = "#{@tenant.renter} was added."
            redirect_to tenant_path(@tenant)
       else
            render :new
       end
    end

    def show 
        #   @rental_property = RentalProperty.find(params[:id])
         @tenant = Tenant.find(params[:id])
    end

    def edit
        @tenant = Tenant.find(params[:id])
        @tenant = current_user.rental_properties
    end

    def update
        @tenant = Tenant.find(params[:id])
        @tenant.update(repair_params)
            if @tenant.save
                flash.notice = "#{@tenant.renter} was updated."
                redirect_to user_tenant_path(@user, @tenant)
            else
                render :edit
            end
    end

    def destroy
        @tenant = Tenant.find(params[:id])
        @tenant.destroy
        flash.notice = "#{@tenant.renter} was deleted from your tenant list."
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
