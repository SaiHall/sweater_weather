class GeoFacade

  def self.create_coordinates(location)
    json = GeoService.get_coords(location)
    refined_json = json[:results][0][:locations][0]
    Location.new(refined_json)
  end

  def self.create_directions(origin, destination)
    json = GeoService.get_directions(origin, destination)
    RoadTrip.new(json[:route])
  end
end
