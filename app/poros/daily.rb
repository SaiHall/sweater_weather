require 'date'
class Daily
  include Formattable
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date_time = format_date(data[:dt])
    @sunrise = format_date(data[:sunrise])
    @sunset = format_date(data[:sunset])
    @max_temp = format_temp(data[:temp][:max])
    @min_temp = format_temp(data[:temp][:min])
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
