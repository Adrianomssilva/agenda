class CustomersController < ApplicationController 
  
def index
  @customers = Customer.all
end

end

teste teste teste teste teste tese teste

def new
  @customer = Customer.new
end

def create 
  @customer = Customer.new(customers_params)
  redirect_to customer_path if customer.save
  render :new
end