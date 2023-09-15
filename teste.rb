class CustomersController <ApplicationController

  before_action :fetch_customer, only: %i[edit, update, show, destroy]
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    redirect_to @customer if customer.save
    render :new
  end

  def show;  end
  
  def edit;  end

  def update
    if customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
  end

  def destroy
    customer.destroy
    redirect_to customers_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email, :birthday, :month)
  end

  def fetch_customer
    @customer = Customer.find(params[:id])
  end

end

@customers.each do |customer|
  customer.name
  customer.email
  customer.birthday
end