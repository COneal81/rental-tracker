class Tenant < ApplicationRecord
    belongs_to :user
     has_many :rental_properties
    # has_many :users, through: :rental_properties
    validates :renter, :address, :renter_email, :renter_cell_phone, :user_id, presence: true
end
