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

  # Long date format
  #
  # @param date [Date] the date object
  # @return day date month year - hour:minutes AM/PM
  def long_date(date)
    date.strftime("%A %d %B %Y - %H:%M %p") rescue 'unknown'
  end

  # Medium date format
  #
  # @param date [Date] the date object
  # @return month/date/year at hour:minutes AM/PM
  def medium_date(date)
    date.strftime("%m/%d/%Y at %H:%M %p") rescue 'unknown'
  end

  # Another style of medium date format
  #
  # @param date [Date] the date object
  # @return day/MONTH/YEAR
  # Produces -> 18 October 2015
  def medium_date2(date)
    date.strftime("%d %B %Y") rescue 'unknown'
  end

  # Short date format
  #
  # @param date [Date] the date object
  # @return year-month-date
  def short_date(date)
    date.strftime("%Y-%m-%d") rescue 'unknown'
  end

  # US date format
  #
  # @param date [Date] the date object
  # @return year-month-date
  def us_date(date)
    date.strftime("%m/%d/%Y at %H:%M %p") rescue 'unknown'
  end
  
  def boolean_to_text(value)
    case value
    when true
      'Yes'
    when false
      'No'
    else
      'Unknown Value'
    end
  end

end
