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

   def edit
      @customer = Customer.find(params[:id])
   end

   def update
      @customer = Customer.find(params[:id])

      if @customer.update(customer_params)
         redirect_to @customer
      
      else
      render :edit
      end
   end

   def destroy

      @customer = Customer.find(params[:id])
      @customer.destroy
      redirect_to root_path
   
   end

   def search
      @search_term = params[:search_term]
      if @search_term.blank?
         redirect_to root_path
      else
         @customers = Customer.where("name ILIKE ?", "%#{@search_term}%")
         # @customers = Customer.where("customers.birthday.month LIKE ?", "%#{@search_term}%")
      
      end

      
   end

   private
      def customer_params
         params.require(:customer).permit(:name, :cell, :e_mail, :birthday)
      end
end
