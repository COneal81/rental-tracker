 <h4> Select Tenant </h4>
        <%= f.collection_select :tenant_id, Tenant.order(:renter), 
        :id, :renter  , include_blank: true %> <br><br>

        <p>or</p>


<div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-1 font-weight-normal">Current Tenant</h4>
      </div>
      <div class="card-body">
        <ul class="list-unstyled mt-3 mb-4">
            <%# <li><strong>Leased to:</strong> <%=link_to @rental_property.tenant,  tenants_path %></li><br> %>
            <li><strong>Last Payment Received:</strong> $<%=link_to @rental_property.payment.amount_paid,  payment_path(@payment)%></li><br>
            <li><strong>Co Renter:</strong> <%= @tenant.co_renter %><br><br>
            <li><strong>Current Address: </strong> <%= @tenant.address %> <br>
            <li><strong>Previous Address:</strong> <%= @rental_property.tenant.address %><br><br>

            <li><strong>Renter Email:</strong> <%= @tenant.renter_email %><br>
            <li><strong>Co Renter Email:</strong> <%= @tenant.co_renter_email %><br><br>

            <li><strong>Renter Cell Phone:</strong> <%= @tenant.renter_cell_phone %><br><br>
            <li><strong>Co Renter Cell Phone:</strong> $<%= @tenant.co_renter_cell_phone %><br><br>
        </ul>
      </div>
    </div>


  TEST SHOW
