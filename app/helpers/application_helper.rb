module ApplicationHelper
  def success_notice
    render "layouts/success_notice" if flash[:success].present?
  end
  
  def error_notice
    render "layouts/error_notice" if flash[:error].present?
  end
end
