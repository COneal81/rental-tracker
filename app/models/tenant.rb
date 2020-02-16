class Tenant < ApplicationRecord
    has_many :rental_properties
    has_many :users, through: :rental_properties
    validates :renter, :address, :renter_email, :renter_cell_phone, presence: true
end
