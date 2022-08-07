class OpenWeatherFacade

  def self.create_forecast(lat, lon)
    json = OpenWeatherService.get_forecast(lat, lon)
    data1 = json[:current]
    data2 = json[:daily][0..4]
    data3 = json[:hourly][0..7]
    Forecast.new(data1, data2, data3)
  end
end
