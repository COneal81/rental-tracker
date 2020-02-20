class RentalProperty < ApplicationRecord
    belongs_to :user
    belongs_to :tenant, optional: true
    has_many :repairs
    

    validates :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, presence: true

end
