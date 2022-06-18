class Public::CustomersController < Public::ApplicationController
  def show
    @owners = current_customer.owners.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
    @items = current_customer.items
  end

  def update
    current_customer.update(customer_params)
    redirect_to customer_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email)
  end
end
