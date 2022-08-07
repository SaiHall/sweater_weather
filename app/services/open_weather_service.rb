class OpenWeatherService < BaseService

  def self.get_forecast(lat, lon)
    response = conn_weather.get("onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts")
    get_json(response)
  end
end
