class HomesController < ApplicationController
  before_action :confirm_owner_log_in, :confirm_customer_log_in

  def top
  end
end
