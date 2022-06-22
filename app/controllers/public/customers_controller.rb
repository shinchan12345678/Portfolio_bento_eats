class Public::CustomersController < Public::ApplicationController
  def show
    @customer = current_customer
    @owners = current_customer.owners.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
    @items = current_customer.items
  end

  def update
    @customer = current_customer
    @owners = current_customer.owners.page params[:page]
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    @items = current_customer.items
    if @customer.update(customer_params)
      redirect_to customer_path, notice: "編集に成功しました"
    else
      render :show
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email)
  end
end
