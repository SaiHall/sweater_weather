require 'rails_helper'

RSpec.describe Business do
  before(:each) do
    json = File.read('./spec/fixtures/business_data.json')
    data = JSON.parse(json, symbolize_names: true)

    @business = Business.new(data)
  end
  it 'exists and has attributes' do


    expect(@business).to be_an_instance_of(Business)
    expect(@business.name).to eq("Taste of China")
    expect(@business.address).to eq("1935 Federal Blvd Denver, CO 80204")
    expect(@business.city).to eq("Denver, CO")
    expect(@business.lat).to eq(39.74702)
    expect(@business.lon).to eq(-105.02571)
  end

  it 'will format an address' do

    expect(@business.address).to eq("1935 Federal Blvd Denver, CO 80204")
    expect(@business.address).to_not eq(["1935 Federal Blvd", "Denver, CO 80204"])
  end

  it 'will format a city to include the state' do

    expect(@business.city).to eq("Denver, CO")
    expect(@business.city).to_not eq("Denver")
  end
end
