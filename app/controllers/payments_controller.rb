class PaymentsController < ApplicationController
    def new 
        @payment = Payment.new
        @tenant_ = Tenant.pluck(:renter, :id)
        @rental_properties = RentalProperty.pluck(:property_name, :id)
    end

    def create
       if @payment = Payment.create(payment_params)
      
            #Flash message here
            redirect_to payment_path(@payment)
       else
            #Flash error here
            render :new
       end
    end

    def show 
        @payment = Payment.find(params[:id])
    end

    

    private

    def payment_params
        params.require(:payment).permit(:amount_owed, :amount_paid)
    end


end
