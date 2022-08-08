require 'rails_helper'

RSpec.describe Business do
  it 'exists and has attributes' do

    business = Business.new(@data)

    expect(business).to be_an_instance_of(Business)
    expect(business.name).to eq()
    expect(business.address).to eq()
    expect(business.lat).to eq()
    expect(business.lon).to eq()
  end
end
