class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def check_admin_status
  	if current_user.is_admin
  		return true
  	else
  		redirect_to root_path, notice: "The page you're looking for doesn't exist"
  	end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob])
  end
end
