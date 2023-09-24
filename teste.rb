class CustomersController < ApplicationController 
  
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new
    if @customer.save(customer_params)
      redirect_to customers_path
    else 
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :cell, :birthday)
    

end