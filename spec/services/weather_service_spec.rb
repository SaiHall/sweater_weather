require "rails_helper"

RSpec.describe OpenWeatherService do
  it 'can return information from a call given a latitude and longitude', :vcr do
    example = File.read('./spec/fixtures/example_weather_call.json') #added mock to not re-record VCR each time, comment out to do live testing
    allow(OpenWeatherService).to receive(:get_forecast).and_return(JSON.parse(example, symbolize_names: true))
    hash = OpenWeatherService.get_forecast('43.047945', '-76.147448')

    expect(hash).to be_a(Hash)
    expect(hash.keys).to include(:current, :hourly, :daily)
    expect(hash.keys).to_not include(:minutely)
    expect(hash[:current].keys).to include(:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :weather)

    expect(hash[:current][:weather]).to be_an(Array)
    expect(hash[:current][:weather].first.keys).to include(:description, :icon)

    expect(hash[:hourly]).to be_an(Array)
    expect(hash[:hourly].first.keys).to include(:dt, :temp, :weather)
    expect(hash[:hourly].first[:weather]).to be_an(Array)
    expect(hash[:hourly].first[:weather].first.keys).to include(:description, :icon)

    expect(hash[:daily]).to be_an(Array)
    expect(hash[:daily].first.keys).to include(:dt, :sunrise, :sunset, :temp, :weather)
    expect(hash[:daily].first[:temp].keys).to include(:min, :max)
    expect(hash[:daily].first[:weather].first.keys).to include(:description, :icon)
  end
end
