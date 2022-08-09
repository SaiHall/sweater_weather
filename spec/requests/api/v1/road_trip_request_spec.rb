require 'rails_helper'

RSpec.describe 'Road trip call', :vcr do
  before(:each) do
    User.create!(email: 'something@special.com', password: "1234", password_confirmation: "1234",  api_key: "79012744298e72fbb257d621cbbde7ca")
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

  it 'returns the correctly formatted response from an api hit' do
    post "/api/v1/road_trip", headers: @headers, params: JSON.generate(@parameters)

    response_body = JSON.parse(response.body, symbolize_names: true)
    roadtrip = response_body[:data]

    expect(roadtrip).to be_a(Hash)
    expect(roadtrip.keys).to include(:id, :type, :attributes)
    expect(roadtrip[:id]).to eq(nil)
    expect(roadtrip[:type]).to eq("roadtrip")
    expect(roadtrip[:attributes]).to be_a(Hash)

    expect(roadtrip[:attributes].keys).to include(:start_city, :end_city, :travel_time, :weather_at_eta)
    expect(roadtrip[:attributes][:start_city]).to be_a(String)
    expect(roadtrip[:attributes][:end_city]).to be_a(String)
    expect(roadtrip[:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:attributes][:weather_at_eta]).to be_a(Hash)

    expect(roadtrip[:attributes][:weather_at_eta].keys).to include(:temperature, :conditions)

    expect(roadtrip[:attributes][:weather_at_eta][:temperature]).to be_an(Integer).or be_a(Float)
    expect(roadtrip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  describe 'sad path, edgecase' do
    it 'will return an error if no start location is provided' do
      bad_parameters = {
                    origin: "",
                    destination: "Pueblo, CO",
                    api_key: "79012744298e72fbb257d621cbbde7ca"
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("param is missing or the value is empty: origin")
    end

    it 'will return an error if start location is missing' do
      bad_parameters = {
                    destination: "Pueblo, CO",
                    api_key: "79012744298e72fbb257d621cbbde7ca"
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("param is missing or the value is empty: origin")
    end

    it 'will return an error if no end location is provided' do
      bad_parameters = {
                    origin: "Denver, CO",
                    destination: "",
                    api_key: "79012744298e72fbb257d621cbbde7ca"
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("param is missing or the value is empty: destination")
    end

    it 'will return an error if end location is missing' do
      bad_parameters = {
                    origin: "Denver, CO",
                    api_key: "79012744298e72fbb257d621cbbde7ca"
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("param is missing or the value is empty: destination")
    end

    it 'will return an error if no api key is provided' do
      bad_parameters = {
                    origin: "Denver, CO",
                    destination: "Pueblo, CO",
                    api_key: ""
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("param is missing or the value is empty: api_key")
    end

    it 'will return an error if api key is missing' do
      bad_parameters = {
                    origin: "Denver, CO",
                    destination: "Pueblo, CO"
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("param is missing or the value is empty: api_key")
    end

    it 'will return an error if api key in invalid' do
      bad_parameters = {
                    origin: "Denver, CO",
                    destination: "Pueblo, CO",
                    api_key: "This is my real api key I swear"
                    }

      post "/api/v1/road_trip", headers: @headers, params: JSON.generate(bad_parameters)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Invalid Credentials")
    end
  end
end
