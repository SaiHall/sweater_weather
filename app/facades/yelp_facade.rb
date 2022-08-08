class YelpFacade

  def self.create_business(location, term)
    json = YelpService.get_business(location, term)
    refined_json = json[:businesses][0]
    Business.new(refined_json)
  end
end
