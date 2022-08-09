class RoadTrip
  include Formattable
  attr_reader :time,
              :start,
              :end,
              :lon,
              :lat

  def initialize(data)
    @time = data[:formattedTime]
    @start = format_town(data[:locations][0])
    @end = format_town(data[:locations][1])
    @lon = data[:locations][1][:displayLatLng][:lng]
    @lat = data[:locations][1][:displayLatLng][:lat]
  end

  def format_town(data)
    "#{data[:adminArea5]}, #{data[:adminArea3]}"
  end
end
