require 'rails_helper'

RSpec.describe 'User api call' do
  it 'can successfully hit the api on a post' do
    user_params = {
                email: 'Something@special.com',
                password: "1234",
                password_confirmation: "1234"
              }
      headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end

  it 'will return the users email and api_key after creation' do
    user_params = {
                email: 'Something@special.com',
                password: "1234",
                password_confirmation: "1234"
              }
      headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

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

  describe 'Sad path/ error handling' do
    it 'will not create a user if password and confirmation do not match' do
      user_params = {
                  email: 'Something@special.com',
                  password: "1234",
                  password_confirmation: "1235"
                }
        headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Password confirmation doesn't match Password")
    end

    it 'will not create a user if the user already exists' do
      User.create(email: 'Something@special.com', password: "1234", password_confirmation: "1234")
      user_params = {
                  email: 'Something@special.com',
                  password: "1234",
                  password_confirmation: "1234"
                }
        headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Email has already been taken")
    end

    it 'will not create a user if p/c field is missing' do
      user_params = {
                  email: 'Something@special.com',
                  password: "1234"
                }
        headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Password confirmation can't be blank")
    end

    it 'will not create a user if email field is missing' do
      user_params = {
                  password: "1234",
                  password_confirmation: "1234"
                }
        headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Email can't be blank")
    end

    it 'will not create a user if password field is missing' do #find out how to remove extra pw can't be blank. All in one message? Limit how many errors somehow?
      user_params = {
                  email: 'Something@special.com',
                  password_confirmation: "1234"
                }
        headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Password can't be blank, Password can't be blank")
    end
  end
end
