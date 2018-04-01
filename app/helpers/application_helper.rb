module ApplicationHelper

  def nice_date_time(datetime)
    datetime.strftime('%b %d, %Y %I:%M %p')
  end
end