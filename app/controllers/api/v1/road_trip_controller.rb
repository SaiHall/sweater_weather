class Api::V1::RoadTripController < ApplicationController

  def create
    render json: RoadTripSerializer.format_road_trip
  end

end
