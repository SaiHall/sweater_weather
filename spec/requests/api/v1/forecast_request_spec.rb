require 'rails_helper'

RSpec.describe 'Forecast API: City/State' do
  it 'can successfully hit the api', :vcr do
    get "/api/v1/forecast?location=denver, co"

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
