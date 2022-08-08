require 'rails_helper'

RSpec.describe 'Munchies API: location/term' do
  it 'can successfully hit the api', :vcr do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'returns the desired information from a munchies api hit', :vcr do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    response_body = JSON.parse(response.body, symbolize_names: true)
    munch = response_body[:data]

    expect(munch).to be_a(Hash)
    expect(munch.keys).to include(:id, :type, :attributes)

    expect(munch[:id]).to eq(nil)
    expect(munch[:type]).to eq("munchie")
    expect(munch[:attributes]).to be_a(Hash)

    expect(munch[:attributes].keys).to include(:destination_city, :forecast, :restaurant)
    expect(munch[:attributes][:destination_city]).to be_a(String)
    expect(munch[:attributes][:forecast]).to be_a(Hash)
    expect(munch[:attributes][:restaurant]).to be_a(Hash)

    expect(munch[:attributes][:forecast].keys).to include(:summary, :temperature)
    expect(munch[:attributes][:forecast][:summary]).to be_a(String)
    expect(munch[:attributes][:forecast][:temperature]).to be_a(String)

    expect(munch[:attributes][:restaurant].keys).to include(:name, :address)
    expect(munch[:attributes][:restaurant][:name]).to be_a(String)
    expect(munch[:attributes][:restaurant][:address]).to be_a(String)
  end
end
