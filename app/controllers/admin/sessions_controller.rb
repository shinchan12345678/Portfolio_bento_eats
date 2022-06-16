# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :admin_customer_sign_in, only: [:create]
  before_action :admin_customer_sign_out, only: [:destroy]

  def after_sign_in_path_for(resource)
    admin_owners_index_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  def admin_customer_sign_in
    admin_customer = Customer.admin
    sign_in admin_customer
  end

  def admin_customer_sign_out
    admin_customer = Customer.find_by(nickname: 'Admin')
    sign_out admin_customer
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
