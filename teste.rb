class CustomersController < ApplicationController 
  
def index
  @customers = Customer.all
end

end

teste teste teste teste teste tese teste

def new
  @customer = Customer.find(params[:id])
  @cutomer.new
end