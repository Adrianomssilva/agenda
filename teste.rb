class CustomerController << ApplicantionController

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
      redirect_to customer_path
    else
    render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :cell, :e_mail, :birthday)
  end
end

        <div class = "filter"> <%= form_with url: search_month_customers_path, method: :get do |form| %>
        <%= form.label :month, "Buscar por:" %>
        <%= form.select :month, (1..12) %>
        <%= form.submit "Filtrar" %>
        <% end %> </div> 