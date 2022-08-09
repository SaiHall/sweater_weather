class GeoService < BaseService

  def self.get_coords(location)
    response = conn_geo.get("geocoding/v1/address") do |f|
      f.params['location'] = location
    end
    get_json(response)
  end

  def self.get_directions(origin, destination)
    response = conn_geo.get("directions/v2/route") do |f|
      f.params['from'] = origin
      f.params['to'] = destination
    end
    get_json(response)
  end

end
