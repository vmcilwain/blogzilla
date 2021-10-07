module ApplicationHelper
  def alert_notice
    render 'layouts/alert_notice' if flash[:alert].present?
  end

  def success_notice
    render 'layouts/success_notice' if flash[:success].present?
  end
  
  def error_notice
    render 'layouts/error_notice' if flash[:error].present?
  end
end
