require 'rails_helper'

RSpec.describe GeoFacade, :vcr do
  it 'can make a location poro from a Geo call' do
    example = File.read('./spec/fixtures/example_weather_call.json')
    allow(OpenWeatherService).to receive(:get_forecast).and_return(JSON.parse(example, symbolize_names: true))
    location = GeoFacade.create_coordinates('Syracuse, NY')

    expect(location).to be_an_instance_of(Location)
  end
end
