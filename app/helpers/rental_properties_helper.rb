module RentalPropertiesHelper
    def leased_boolean_display(attribute)
        attribute == true ? "Yes" : "No"
    end
end
