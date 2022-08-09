require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes' do
    json = File.read('./spec/fixtures/example_directions_call.json')
    data = JSON.parse(json, symbolize_names: true)

    trip = RoadTrip.new(data[:route])

    expect(trip).to be_an_instance_of(RoadTrip)
    expect(trip.time).to eq("10:45:03")
    expect(trip.start).to eq("North Port, FL")
    expect(trip.end).to eq("New Orleans, LA")
    expect(trip.lon).to eq(-90.074951)
    expect(trip.lat).to eq(29.950621)
  end
end
