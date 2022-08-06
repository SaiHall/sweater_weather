class BaseService
  def self.conn_geo
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |req|
      req.params['key'] = ENV['GEO_API_KEY']
    end
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
