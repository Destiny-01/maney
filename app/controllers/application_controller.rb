class ApplicationController < ActionController::Base
  
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role, :status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :current_password, :password, :password_confirmation, :role, :status])
 end
end
  #  def configure_permitted_parameters
  #    devise_parameter_sanitizer.for(:sign_up).push(:email, :password, :password_confirmation, :role, :status, :stat)
  #  end

  #  def configure_permitted_account_parameters
  #    devise_parameter_sanitizer.for(:account_update).push(:email, :current_password, :password,
  #    :password_confirmation, :role, :status, :stat)
  #  end
#  end
