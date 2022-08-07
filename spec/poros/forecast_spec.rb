require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes' do
    json = File.read('./spec/fixtures/data1_exp.json')
    @data1 = JSON.parse(json, symbolize_names: true)

    json = File.read('./spec/fixtures/data2_exp.json')
    @data2 = JSON.parse(json, symbolize_names: true)

    json = File.read('./spec/fixtures/data3_exp.json')
    @data3 = JSON.parse(json, symbolize_names: true)

    forecast = Forecast.new(@data1, @data2, @data3)

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.current).to be_an_instance_of(Current)
    expect(forecast.daily).to be_an(Array)
    expect(forecast.daily).to be_all(Daily)
    expect(forecast.hourly).to be_an(Array)
    expect(forecast.hourly).to be_all(Hourly)
  end
end
