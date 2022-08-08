require 'rails_helper'

RSpec.describe 'User login api call' do
  before(:each) do
    User.create(email: 'Something@special.com', password: "1234", password_confirmation: "1234",  api_key: SecureRandom.hex)
    user_params = {
                email: 'Something@special.com',
                password: "1234"
              }
      headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)
  end
  it 'can successfully hit the api on a post' do

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'will return the users email and api_key after successful log in' do

    response_body = JSON.parse(response.body, symbolize_names: true)
    user_return = response_body[:data]

    expect(user_return).to be_a(Hash)
    expect(user_return.keys).to include(:type, :id, :attributes)
    expect(user_return[:type]).to eq("users")
    expect(user_return[:id]).to be_an(Integer)
    expect(user_return[:attributes]).to be_a(Hash)

    expect(user_return[:attributes].keys).to include(:email, :api_key)
    expect(user_return[:attributes].keys).to_not include(:password, :password_digest, :password_confirmation)
    expect(user_return[:attributes][:email]).to be_a(String)
    expect(user_return[:attributes][:api_key]).to be_a(String)
  end
end
