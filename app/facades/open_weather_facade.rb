class OpenWeatherFacade

  def self.create_forecast(lat, lon)
    json = OpenWeatherService.get_forecast(lat, lon)
    data1 = json[:current]
    data2 = json[:daily][0..4]
    data3 = json[:hourly][0..7]
    Forecast.new(data1, data2, data3)
  end

  def self.create_future_weather(lat, lon, hours)
    if hours < 48
      json = OpenWeatherService.get_forecast(lat, lon)
      data = json[:hourly][hours.to_i + 1]
      Hourly.new(data)
    elsif hours >= 48
      days = hours / 24
      json = OpenWeatherService.get_forecast(lat, lon)
      data = json[:daily][days]
      Daily.new(data)
    end
  end
end
