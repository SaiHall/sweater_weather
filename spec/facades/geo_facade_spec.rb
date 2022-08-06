require 'rails_helper'

RSpec.describe GeoFacade, :vcr do
  it 'can make a location poro from a Geo call' do
    location = GeoFacade.create_coordinates('Syracuse, NY')

    expect(location).to be_an_instance_of(Location)
  end
end
