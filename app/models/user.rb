class User < ApplicationRecord
    
    has_many :rental_properties
    has_many :tenants
    has_many :supplies
    # has_many :repairs, through: :supplies
    has_many :repairs, through: :rental_properties
   

    has_secure_password
    validates :name, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..64 }

end
