class Business
  attr_reader :name,
              :address,
              :lat,
              :lon

  def initialize(data)
    @name = data[:name]
    @address = format_address(data[:location][:display_address])
    @lat = data[:coordinates][:latitude]
    @lon = data[:coordinates][:longitude]
  end

  def format_address(data)
    data.join(' ')
  end
end
