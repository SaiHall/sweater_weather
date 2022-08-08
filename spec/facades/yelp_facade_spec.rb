require 'rails_helper'

RSpec.describe YelpFacade, :vcr do
  it 'can make a business poro from a Yelp call' do
    business = YelpFacade.create_business('Syracuse, NY', 'Pizza')

    expect(business).to be_an_instance_of(Business)
  end
end
