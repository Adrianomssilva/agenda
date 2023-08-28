class CustomersController < ApplicationController

   before_action :fetch_customer, only: [:edit, :update, :show, :destroy]

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
   

   def show; end

   def edit; end

   def update
      return redirect_to customer_path if @customer.update(customer_params)

      render :edit
   end

   def destroy

      @customer.destroy

      redirect_to customers_path
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
      def fetch_customer
         @customer = Customer.find(params[:id])
      end
end
