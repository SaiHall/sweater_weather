class Api::V1::MunchiesController < ApplicationController

  def index
    business = YelpFacade.create_business(munch_params[:location], munch_params[:food])
    current = OpenWeatherFacade.create_current(business.lat, business.lon)
    render json: MunchiesSerializer.format_munchies(business, current)
  end

  private
    def munch_params
      params.require(:location)
      params.require(:food)
      params.permit(:location, :food)
    end
end
