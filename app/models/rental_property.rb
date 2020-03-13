class RentalProperty < ApplicationRecord
    # has_many :tenants

    belongs_to :user
    has_many :repairs
    belongs_to :tenant, optional: true
    
    

    validates :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, presence: true

    
end
