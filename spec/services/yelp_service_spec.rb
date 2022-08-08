require "rails_helper"

RSpec.describe YelpService do
  it 'can return information from a call given a location and search term' do
    returned_hash = YelpService.get_business('43.047945', '-76.147448', 'chinese')
  end
end
