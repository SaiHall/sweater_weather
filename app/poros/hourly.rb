require 'date'
class Hourly
  include Formattable
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = format_time(data[:dt])
    @temperature = format_temp(data[:temp])
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
