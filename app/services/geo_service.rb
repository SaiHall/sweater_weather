class GeoService < BaseService

  def self.get_coords(location)
    response = conn_geo.get("address?location=#{location}")
    get_json(response)
  end

end
