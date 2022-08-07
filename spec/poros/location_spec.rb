require 'rails_helper'

RSpec.describe Location do
  it 'exists and has attributes' do
    json = File.read('./spec/fixtures/example_geo_call.json')
    data = JSON.parse(json, symbolize_names: true)

    loc = Location.new(data)

    expect(loc).to be_an_instance_of(Location)
    expect(loc.lat).to eq(43.047945)
    expect(loc.lon).to eq(-76.147448)
  end
end
