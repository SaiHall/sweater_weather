class YelpService < BaseService

  def self.get_business(location, term)
    response = conn_yelp.get("businesses/search?location=#{location}&term=#{term}")
    get_json(response)
  end
end
