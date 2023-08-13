class CustomersController < ApplicationController

   def index
      @customers = Customer.all
      
   end

   def new
    @customer = Customer.new
   end

   def create
      @customer = Customer.new(customer_params)
      
      if @customer.save
         redirect_to customers_path

      
      else
         render :new, status: :unprocessable_entity
      end

   end
   

   def show
   @customer = Customer.find(params[:id])
   end




   private
   def customer_params
   
   params.require(:customer).permit(:name, :cell, :e_mail, :birthday)
   end

end