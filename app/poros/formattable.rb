module Formattable

  def format_date(unix)
    Time.at(unix).to_datetime.strftime('%Y-%m-%d%l:%M:%S')
  end

  def format_temp(kelvin)
    (((kelvin - 273.15) * (9.0 / 5.0)) + 32.0).round(3)
  end

  def format_time(unix)
    Time.at(unix).to_datetime.strftime('%H:%M:%S')
  end

  def format_date_only(unix)
    Time.at(unix).to_datetime.strftime('%Y-%m-%d')
  end
end
