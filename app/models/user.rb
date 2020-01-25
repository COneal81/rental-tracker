class User < ApplicationRecord
    #list associations
    has_secure_password

    has_many :rental_properties
    has_many :tenants, through: :rental_properties
    has_many :repairs, through: :rental_properties
    has_many :payments, through: :rental_properties
end
