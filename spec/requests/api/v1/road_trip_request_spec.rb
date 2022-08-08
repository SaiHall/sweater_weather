require 'rails_helper'

RSpec.describe 'Road trip call' do
  before(:each) do
    x = User.create!(email: 'something@special.com', password: "1234", password_confirmation: "1234",  api_key: "79012744298e72fbb257d621cbbde7ca")
    @parameters = {
                  origin: "Denver, CO",
                  destination: "Pueblo, CO",
                  api_key: "79012744298e72fbb257d621cbbde7ca"
                  }
      @headers = {"CONTENT_TYPE" => "application/json"}
  end

  it 'can successfully hit the api' do
    post "/api/v1/road_trip", headers: @headers, params: JSON.generate(@parameters)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
