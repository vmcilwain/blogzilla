class ApplicationController < ActionController::Base
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  add_flash_types :success, :error
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def error_message
    flash[:error] = I18n.t('alert.error')
  end
  
  def success_message(object, status = :created)
    I18n.t('alert.success', class_name: object.class.name.titleize, status: status.to_s)
  end

  def user_not_authorized
    flash[:alert] = I18n.t('alert.authorization')
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
