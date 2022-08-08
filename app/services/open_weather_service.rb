class OpenWeatherService < BaseService

  def self.get_forecast(lat, lon)
    response = conn_weather.get("onecall?exclude=minutely,alerts") do |f|
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['exclude'] = "minutely,alerts"
    end
    get_json(response)
  end
end
