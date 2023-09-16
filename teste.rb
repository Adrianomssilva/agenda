class CustomersController<ApplicationController

  before_action :fetch_customer, only: %i[edit, update, show, destroy]
  
  def index
    @customers = Customers.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def show;  end

  def edit;  end

  def update
    redirect_to customer_path if @customer.update(customer_params)
    rende :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :birthday)
  end

  def fetch_customer
    @customer = Customer.find(params[:id])
  end