class Api::V1::ForecastController < ApplicationController

  def index
    render json: ForecastSerializer.format_forecast
  end
end
