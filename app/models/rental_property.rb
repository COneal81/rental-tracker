class RentalProperty < ApplicationRecord
    belongs_to :user
    belongs_to :tenant
    belongs_to :payment 
    has_many :repairs

    validates :property_name, :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, :user_id, :tenant_id, :payment_id, presence: true
end
