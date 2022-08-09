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

  it 'can return information from a call given two locations' do
    hash = GeoService.get_directions('Miami, FL', 'New Oreleans, LA')

    expect(hash).to be_a(Hash)
    expect(hash).to have_key(:route)
    expect(hash[:route]).to be_a(Hash)
    expect(hash[:route].keys).to include(:routeError, :formattedTime, :boundingBox)
    expect(hash[:route][:routeError]).to be_a(Hash)
    expect(hash[:route][:routeError].keys).to include(:errorCode, :message)

    expect(hash[:route][:locations]).to be_a(Array)
    expect(hash[:route][:locations][0]).to be_a(Hash)
    expect(hash[:route][:locations][0].keys).to include(:adminArea5, :adminArea3, :displayLatLng)
    expect(hash[:route][:locations][1]).to be_a(Hash)
    expect(hash[:route][:locations][1].keys).to include(:adminArea5, :adminArea3, :displayLatLng)
    expect(hash[:route][:locations][1][:displayLatLng]).to include(:lng, :lat)
  end
end
