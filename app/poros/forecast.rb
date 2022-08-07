class Forecast
  attr_reader :current,
              :daily,
              :hourly

  def initialize(data1, data2, data3)
    @current = format_current(data1)
    @daily = format_daily(data2)
    @hourly = format_hourly(data3)
  end

  def format_current(data)
    Current.new(data)
  end

  def format_daily(data)
    data.map { |day| Daily.new(day) }
  end

  def format_hourly(data)
    data.map { |hour| Hourly.new(hour)}
  end
end
