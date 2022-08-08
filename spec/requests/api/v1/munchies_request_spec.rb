require 'rails_helper'

RSpec.describe 'Munchies API: location/term' do
  it 'can successfully hit the api', :vcr do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
