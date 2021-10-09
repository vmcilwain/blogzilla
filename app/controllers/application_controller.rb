class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def flash_error_notice
    flash[:error] = 'There were errors!'
  end
  
  def success_notice(object, status = :created)
    "#{object.class.name.titleize} was successfully #{status}"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
