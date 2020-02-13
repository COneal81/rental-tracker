class User < ApplicationRecord
    
    has_secure_password
    validates :name, length: { minimum: 2 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 4..20 }

    has_many :rental_properties
    has_many :tenants, through: :rental_properties
    has_many :repairs, through: :rental_properties

    private

    def self.from_omniauth(auth)
      # Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |user|
        user.name = auth.info.name
        user.email = auth.info.email
      end
    end
end
