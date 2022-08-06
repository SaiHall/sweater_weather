class GeoFacade

  def self.create_coordinates(location)
    json = GeoService.get_coords(location)
    refined_json = json[:results][0][:locations][0]
    Location.new(refined_json)
  end
end
