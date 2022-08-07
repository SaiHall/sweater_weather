require "rails_helper"

RSpec.describe GeoService, :vcr do
  it 'can return information from a call given a location' do
    hash = GeoService.get_coords('Miami, FL')

    expect(hash).to be_a(Hash)
    expect(hash).to have_key(:results)
    expect(hash[:results].first).to have_key(:locations)
    deeper = hash[:results].first[:locations].first
    expect(deeper.keys).to include(:latLng)
    expect(deeper[:latLng]).to be_a(Hash)
    expect(deeper[:latLng].keys).to include(:lat, :lng)
  end
end
