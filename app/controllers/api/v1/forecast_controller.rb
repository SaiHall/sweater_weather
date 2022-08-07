class Api::V1::ForecastController < ApplicationController

  def index
    loc = GeoFacade.create_coordinates(params[:location])
    forecast = OpenWeatherFacade.create_forecast(loc.lat, loc.lon)
    render json: ForecastSerializer.format_forecast(forecast)
  end
end
