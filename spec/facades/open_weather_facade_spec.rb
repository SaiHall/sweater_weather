require 'rails_helper'

RSpec.describe OpenWeatherFacade, :vcr do
  it 'can make a forecast poro from an open weather call' do
    forecast = OpenWeatherFacade.create_forecast('43.047945', '-76.147448')

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.daily.length).to be(5)
    expect(forecast.hourly.length).to be(8)
  end

  it 'can make a current poro from an open weather call' do
    current = OpenWeatherFacade.create_current('43.047945', '-76.147448')

    expect(current).to be_an_instance_of(Current)
  end
end
