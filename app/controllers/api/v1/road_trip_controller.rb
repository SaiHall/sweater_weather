class Api::V1::RoadTripController < ApplicationController

  def create
    trip = GeoFacade.create_directions(trip_params[:origin], trip_params[:destination])
    if !trip_params[:api_key] || !User.valid_key?(trip_params[:api_key])
      json_response({message: "Unauthorized Request"}, 401)
    elsif trip == "impossible route"
      render json: RoadTripSerializer.format_impossible_route(trip_params[:origin], trip_params[:destination])
    else
      forecast = OpenWeatherFacade.create_future_weather(trip.lat, trip.lon, trip.hours)
      render json: RoadTripSerializer.format_road_trip(trip, forecast)
    end
  end

  private
  def trip_params
    params.require(:origin)
    params.require(:destination)
    params.permit(:origin, :destination, :api_key)
  end
end
