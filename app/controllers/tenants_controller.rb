class TenantsController < ApplicationController  

    before_action :current_user, :logged_in?, :set_rental_properties, :set_tenants

    def index
          if @tenants.empty?
            flash.alert = "No Tenants Found"
          else
            @tenants = current_user.tenants
          end

            #  @tenants = Tenant.all
        # @tenants = current_user.tenants
        
    end

    def new 
        @tenant= Tenant.new
        @user = current_user
        # binding.pry
    end

    def create
        @tenant = current_user.tenants.build(tenant_params)
        #  binding.pry
         if @tenant.valid?
            @tenant.save
            flash.notice = "#{@tenant.renter} was added."
            redirect_to tenant_path(@tenant)
       else
            render :new
       end
    end

    def show 
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
        :address, :renter_email, :co_renter_email, :renter_cell_phone, :co_renter_cell_phone, :user_id)
    end

    def set_tenants
        @tenants = current_user.tenants
    end
    
end
