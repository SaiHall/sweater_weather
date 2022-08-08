class BaseService
  def self.conn_geo
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |req|
      req.params['key'] = ENV['GEO_API_KEY']
    end
  end

  def self.conn_weather
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/") do |req|
      req.params['appid'] = ENV['OW_API_KEY']
    end
  end

  def self.conn_yelp
    Faraday.new(url: "https://api.yelp.com/v3/") do |req|
      req.headers['Authorization'] = ENV['YELP_API_KEY']
    end
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
