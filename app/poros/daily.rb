require 'date'
class Daily
  include Formattable
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon,
              :temperature

  def initialize(data)
    @date = format_date_only(data[:dt])
    @sunrise = format_date(data[:sunrise])
    @sunset = format_date(data[:sunset])
    @max_temp = format_temp(data[:temp][:max])
    @min_temp = format_temp(data[:temp][:min])
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
    @temperature = avg_temp(@max_temp, @min_temp)
  end

  def avg_temp(max, min)
    (max + min) / 2
  end
end
