require 'rails_helper'

RSpec.describe 'User login api call' do
  it 'can successfully hit the api on a post' do
    User.create(email: 'Something@special.com', password: "1234", password_confirmation: "1234",  api_key: SecureRandom.hex)
    user_params = {
                email: 'Something@special.com',
                password: "1234"
              }
      headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/sessions", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
