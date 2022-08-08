class Api::V1::ForecastController < ApplicationController

  def index
    loc = GeoFacade.create_coordinates(forc_params[:location])
    forecast = OpenWeatherFacade.create_forecast(loc.lat, loc.lon)
    render json: ForecastSerializer.format_forecast(forecast)
  end

  private
    def forc_params
      params.require(:location)
      params.permit(:location)
    end
end
