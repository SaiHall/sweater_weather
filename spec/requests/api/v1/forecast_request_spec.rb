require 'rails_helper'

RSpec.describe 'Forecast API: City/State' do
  it 'can successfully hit the api', :vcr do
    get "/api/v1/forecast?location=denver, co"

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'returns a forecast from forecast api hit', :vcr do
    get "/api/v1/forecast?location=denver, co"

    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]

    expect(forecast).to be_a(Hash)

    expect(forecast.keys).to include(:attributes, :id, :type)
    expect(forecast[:id]).to eq(nil)
    expect(forecast[:type]).to eq('forecast')
    expect(forecast[:attributes]).to be_a(Hash)

    expect(forecast[:attributes].keys).to include(:current_weather, :daily_weather, :hourly_weather)
    current = forecast[:attributes][:current_weather]
    daily = forecast[:attributes][:daily_weather]
    hourly = forecast[:attributes][:hourly_weather]

    expect(current).to be_a(Hash)
    expect(current.keys).to include(:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon)
    expect(current[:datetime]).to be_a(String)
    expect(current[:sunrise]).to be_a(String)
    expect(current[:sunset]).to be_a(String)
    expect(current[:temperature]).to be_a(Float)
    expect(current[:feels_like]).to be_a(Float)
    expect(current[:humidity]).to be_an(Integer)
    expect(current[:uvi]).to be_a(Float).or be_an(Integer)
    expect(current[:visibility]).to be_an(Integer)
    expect(current[:conditions]).to be_a(String)
    expect(current[:icon]).to be_a(String)

    expect(daily).to be_an(Array)
    expect(daily[0].keys).to include(:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)
    expect(daily[0][:date]).to be_a(String)
    expect(daily[0][:sunrise]).to be_a(String)
    expect(daily[0][:sunset]).to be_a(String)
    expect(daily[0][:max_temp]).to be_a(Float)
    expect(daily[0][:min_temp]).to be_a(Float)
    expect(daily[0][:conditions]).to be_a(String)
    expect(daily[0][:icon]).to be_a(String)

    expect(hourly).to be_an(Array)
    expect(hourly[0].keys).to include(:time, :temperature, :conditions, :icon)
    expect(hourly[0][:time]).to be_a(String)
    expect(hourly[0][:temperature]).to be_a(Float)
    expect(hourly[0][:conditions]).to be_a(String)
    expect(hourly[0][:icon]).to be_a(String)
  end

  it 'does not contain unnecessary data', :vcr do
    get "/api/v1/forecast?location=denver, co"

    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]
    current = forecast[:attributes][:current_weather]
    daily = forecast[:attributes][:daily_weather][0]
    hourly = forecast[:attributes][:hourly_weather][0]

    expect(current.keys).to_not include(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg, :wind_gust, :max_temp, :min_temp)
    expect(hourly.keys).to_not include(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg, :wind_gust, :humidity, :max_temp, :min_temp, :uvi)
    expect(daily.keys).to_not include(:moonrise, :moonset, :moonphase, :pressure, :humidity, :wind_speed, :wind_deg, :wind_gust, :uvi)
  end
end
