class CustomersController < ApplicationController 
  
def index
  @customers = Customer.all
end

end

teste teste teste teste teste tese teste

def new
  @customer = Customer.find(params[:id])
  if @customer.new
    redirect_to @customer_path
  else 
    render new 
end