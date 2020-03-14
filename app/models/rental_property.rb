class RentalProperty < ApplicationRecord

    belongs_to :user
    has_many :repairs
    belongs_to :tenant, optional: true

    validates :property_name, :address, :monthly_rental_amount, :deposit_amount, 
        :square_feet, presence: true

    scope :available_properties, ->(current_user) {where(leased: false).where(rental_properties: {user_id: current_user}).uniq }
    scope :affordable_available_properties, -> (current_user) {where(leased: false).where("monthly_rental_amount < 700").where(rental_properties: {user_id: current_user}).uniq }

end
