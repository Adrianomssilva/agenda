
class CustomerController << ApplicationController

  before_action :fetch_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.All
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

  def show;  end

  def edit;  end

  def update
    return redirect_to customer_path if @customer.update(customer_params)
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :cell, :e_mail, :birthday )
  end

  def fetch_customer
    @cutomer = Customer.find(params[:id])
  end
end
