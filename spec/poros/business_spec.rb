require 'rails_helper'

RSpec.describe Business do
  it 'exists and has attributes' do
    json = File.read('./spec/fixtures/business_data.json')
    data = JSON.parse(json, symbolize_names: true)

    business = Business.new(data)

    expect(business).to be_an_instance_of(Business)
    expect(business.name).to eq("Taste of China")
    expect(business.address).to eq("1935 Federal Blvd Denver, CO 80204")
    expect(usiness.city).to eq("Denver, CO")
    expect(business.lat).to eq(39.74702)
    expect(business.lon).to eq(-105.02571)
  end
end
