class RentalProperty < ApplicationRecord
    # has_many :tenants

    belongs_to :user
    has_many :repairs
    # has_many :supplies, through: :repairs
    belongs_to :tenant, optional: true

    validates :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, presence: true

    
    scope :available_properties, -> {where(leased: false)}
    scope :affordable_available_properties, -> {where(leased: false).where("monthly_rental_amount < 700")}

end
