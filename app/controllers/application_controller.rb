 class ApplicationController < ActionController::Base
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up).push(:email, :password, :password_confirmation, :role, :status)
   end

   def configure_permitted_account_parameters
     devise_parameter_sanitizer.for(:account_update).push(:email, :current_password, :password,
         :password_confirmation, :role, :status)
   end
 end
