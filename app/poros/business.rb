class Business
  attr_reader :name,
              :address,
              :city,
              :lat,
              :lon

  def initialize(data)
    @name = data[:name]
    @address = format_address(data[:location][:display_address])
    @city = format_city(data[:location])
    @lat = data[:coordinates][:latitude]
    @lon = data[:coordinates][:longitude]
  end

  def format_address(data)
    data.join(' ')
  end

  def format_city(data)
    "#{data[:city]}, #{data[:state]}"
  end
end
