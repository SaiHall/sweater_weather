class Api::V1::RoadTripController < ApplicationController

  def create
    trip = GeoFacade.create_directions(trip_params[:origin], trip_params[:destination])
    forecast = OpenWeatherFacade.create_future_weather(trip.lat, trip.lon, trip.hours)
    render json: RoadTripSerializer.format_road_trip(trip, forecast)
  end

  private

  def trip_params
    params.require(:origin)
    params.require(:destination)
    params.require(:api_key)
    params.permit(:origin, :destination, :api_key)
    end
end
