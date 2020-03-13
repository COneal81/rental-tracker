class Supply < ApplicationRecord
     has_many :rental_properties
     has_many :users, through: :rental_properties
end
