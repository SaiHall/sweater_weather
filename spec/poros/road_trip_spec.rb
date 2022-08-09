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
    expect(trip.hours).to eq(10)
  end

  it 'will correctly format entered data' do
    json = File.read('./spec/fixtures/example_directions_call.json')
    data = JSON.parse(json, symbolize_names: true)

    trip = RoadTrip.new(data[:route])

    expect(trip.hours).to eq(10)
    expect(trip.hours).to_not eq("10:45:03")

    expect(trip.start).to eq("North Port, FL")
    expect(trip.start).to_not eq("North Port")
    expect(trip.start).to_not eq("FL")
  end
  it 'will format a differently formatted town correctly' do
    json = File.read('./spec/fixtures/bad_format_end.json')
    data = JSON.parse(json, symbolize_names: true)

    trip = RoadTrip.new(data[:route])

    expect(trip.start).to eq('New York, NY')
    expect(trip.end).to eq('Panama City, PA')
  end
end
