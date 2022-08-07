require 'rails_helper'

RSpec.describe 'User api call' do
  it 'can successfully hit the api on a post' do
    post "/api/v1/users"

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end
