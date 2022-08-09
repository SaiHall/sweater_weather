require 'rails_helper'

RSpec.describe OpenWeatherFacade, :vcr do
  it 'can make a forecast poro from an open weather call' do
    forecast = OpenWeatherFacade.create_forecast('43.047945', '-76.147448')

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.daily.length).to be(5)
    expect(forecast.hourly.length).to be(8)
  end

  it 'will make an hourly poro for the furture, given a number of hours below 48' do
    test = OpenWeatherFacade.create_future_weather('43.047945', '-76.147448', "10")
    expect(test).to be_an_instance_of(Hourly)
  end

  it 'will make a daily poro given a number of hours greater than or equal to 48' do
    test = OpenWeatherFacade.create_future_weather('43.047945', '-76.147448', "56")
    expect(test).to be_an_instance_of(Daily)
  end
end
