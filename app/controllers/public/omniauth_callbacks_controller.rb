class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    info = Customer.find_oauth(@omniauth)
    @customer = info[:customer]
    if @customer.persisted?
      sign_in @customer, event: :authentication
      redirect_to informations_path
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      render template: "public/registrations/new"
    end
  end

  def failure
    redirect_to root_path and return
  end
end
