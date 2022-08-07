require 'date'
class Current
  include Formattable
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @date_time = format_date(data[:dt])
    @sunrise = format_date(data[:sunrise])
    @sunset = format_date(data[:sunset])
    @temperature = format_temp(data[:temp])
    @feels_like = format_temp(data[:feels_like])
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
