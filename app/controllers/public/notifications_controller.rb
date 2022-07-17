class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_customer.notifications.page(params[:page])
    @notifications.where(is_checked: false).each do |notification|
      notification.update(is_checked: true)
    end
  end

  def destroy_all
    @notifications = current_customer.notifications.destroy_all
    redirect_to customer_path
  end
end
