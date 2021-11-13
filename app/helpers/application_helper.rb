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

  def authentication_action
    if user_signed_in?
      link_to 'Sign Out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign In', new_user_session_path
    end
  end

  # Long date format
  #
  # @param date [Date] the date object
  # @return day date month year - hour:minutes AM/PM
  def long_date(date)
    date.strftime('%A %d %B %Y - %H:%M %p') if date.respond_to? :strftime
  end

  # Medium date format
  #
  # @param date [Date] the date object
  # @return month/date/year at hour:minutes AM/PM
  def medium_date(date)
    date.strftime('%m/%d/%Y at %H:%M %p') if date.respond_to? :strftime
  end

  # Another style of medium date format
  #
  # @param date [Date] the date object
  # @return day MONTH YEAR
  # Produces -> 18 October 2015
  def medium_date2(date)
    date.strftime('%d %B %Y') if date.respond_to? :strftime
  end

  # Yet Another style of medium date format
  #
  # @param date [Date] the date object
  # @return month day, year
  # Produces -> October 18, 2015
  def medium_date3(date)
    date.strftime('%B %d, %Y') if date.respond_to? :strftime
  end

  # Short date format
  #
  # @param date [Date] the date object
  # @return year-month-date
  # Produces -> 2015-10-18
  def short_date(date)
    date.strftime('%Y-%m-%d') if date.respond_to? :strftime
  end

  # US date format
  #
  # @param date [Date] the date object
  # @return year-month-date
  def us_date(date)
    date.strftime('%m/%d/%Y at %H:%M %p') if date.respond_to? :strftime
  end
  
  def boolean_to_text(value)
    case value
    when true
      'Yes'
    when false
      'No'
    else
      value
    end
  end
end
