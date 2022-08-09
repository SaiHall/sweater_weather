class Api::V1::RoadTripController < ApplicationController

  def create
    # trip = GeoFacade.create_directions(trip_params[:origin], trip_params[:destination])
    # forecast = OpenWeatherFacade.get_future_weather(trip.lat, lat.lon)
    render json: RoadTripSerializer.format_road_trip
  end

  private

  def trip_params
    params.require(:origin)
    params.require(:destination)
    params.require(:api_key)
    params.permit(:origin, :destination, :api_key)
    end
end
