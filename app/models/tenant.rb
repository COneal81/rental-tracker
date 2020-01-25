class Tenant < ApplicationRecord
    has_many :rental_properties
    has_many :payments, through: :rental_properties
end
