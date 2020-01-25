class Payment < ApplicationRecord
    has_many :rental_properties
    has_many :tenants, through: :rental_properties
end
