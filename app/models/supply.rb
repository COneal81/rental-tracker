class Supply < ApplicationRecord
    has_many :repairs
    has_many :rental_properties, through: :repairs
end
