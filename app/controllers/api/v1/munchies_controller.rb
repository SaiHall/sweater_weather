class Api::V1::MunchiesController < ApplicationController

  def index
    business = YelpFacade.create_business(params[:location], params[:food])
    current = OpenWeatherFacade.create_current(business.lat, business.lon)
    render json: MunchiesSerializer.format_munchies(business, current)
  end
end
