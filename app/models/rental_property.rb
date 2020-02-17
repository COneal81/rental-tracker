class RentalProperty < ApplicationRecord
    belongs_to :user
    belongs_to :tenant
    has_many :repairs
    has_many :supplies, through: :repairs

    validates :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, :tenant_id, presence: true

       

end
