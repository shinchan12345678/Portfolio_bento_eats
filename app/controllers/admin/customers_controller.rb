class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page])
  end

  def destroy
    Customer.find(params[:id]).destroy
    redirect_to admin_customers_path, notice: 'カスタマーを削除しました'
  end
end
