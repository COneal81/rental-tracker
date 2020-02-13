class Tenant < ApplicationRecord
    has_many :rental_properties
    
    validates :renter, :co_renter, :address, :renter_email, :co_renter_email, :renter_cell_phone, 
        :co_renter_cell_phone, presence: true
end
