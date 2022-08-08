require "rails_helper"

RSpec.describe YelpService, :vcr do
  it 'can return information from a call given a location and search term' do
    returned_hash = YelpService.get_business('denver, co', 'chinese')

    expect(returned_hash).to be_a(Hash)
    expect(returned_hash).to have_key(:businesses)

    expect(returned_hash[:businesses]).to be_an(Array)
    expect(returned_hash[:businesses][0]).to be_a(Hash)
    expect(returned_hash[:businesses][0].keys).to include(:name, :coordinates, :location)

    expect(returned_hash[:businesses][0][:coordinates]).to be_a(Hash)
    expect(returned_hash[:businesses][0][:coordinates].keys).to include(:latitude, :longitude)

    expect(returned_hash[:businesses][0][:location]).to be_a(Hash)
    expect(returned_hash[:businesses][0][:location].keys).to include(:address1, :city, :zip_code, :state, :display_address)
  end
end
