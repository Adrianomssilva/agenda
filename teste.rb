class CustomersController << ApplicationController

  before_action :fetch_customer, only: [:edit, :update, :show, :destroy]
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if customer.save
      redirect_to customers_path    
    else
      render :new, :unprocessable_entity
    end
  end

  def show;  end

  def edit;  end
  
  def update
    if @customer.update
      redirect_to customer_path
    else
      render :edit
  end

  def destroy
    @customer.destroy 
    redirect_to customer_path 
  end
  private
    def customer_params
      params.require(:customer).permit(:name, :cell, :birthday, :e_mail)
    end
    def fetch_customer
      @customer = Customer.find(params[:id])
    end
end