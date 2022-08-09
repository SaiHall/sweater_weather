require 'rails_helper'

RSpec.describe GeoFacade, :vcr do
  it 'can make a location poro from a coord call' do
    location = GeoFacade.create_coordinates('Syracuse, NY')

    expect(location).to be_an_instance_of(Location)
  end

  it 'can make a road trip poro from a direction call' do
    trip = GeoFacade.create_directions("Syracuse, NY", "North Port, FL")

    expect(trip).to be_an_instance_of(RoadTrip)
  end
end
