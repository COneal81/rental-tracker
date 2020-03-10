class RentalProperty < ApplicationRecord
    belongs_to :user
    belongs_to :tenant, optional: true
    has_many :repairs
    validates_associated :tenant
    

    validates :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, presence: true

    def tenants_attributes=(tenants_attributes)
        if !tenants_attributes[:renter].enmpty?
        tenants_attributes.values.each do |tenant_attribute|
            @new_tenant = Tenant.find_or_create_by(tenant_attribute)
            self.tenants << tenant
        end
    end
end
end
