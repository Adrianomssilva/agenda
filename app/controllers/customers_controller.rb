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
         customer_month
    
         redirect_to customers_path

      
      else
         render :new, status: :unprocessable_entity
      end

   end
   

   def show; end

   def edit; end

   def update
      if @customer.update(customer_params)
         customer_month_up
         redirect_to customer_path
      else
      render :edit
      end
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
   

      def search_month
         @search_month = params[:search_month].to_i
         @customers = Customer.where("month = ?", @search_month)
      end


   private
      def customer_params
         params.require(:customer).permit(:name, :cell, :e_mail, :birthday, :month)
      end
      def fetch_customer
         @customer = Customer.find(params[:id])
      end
      def customer_month
         @customer.month = @customer.birthday.month
         @customer.save
      end
      def customer_month_up
         @customer.month = @customer.birthday.month
         @customer.update(customer_params)
      end
end
