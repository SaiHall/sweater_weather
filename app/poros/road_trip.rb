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
    @lon = data[:boundingBox][:ul][:lng]
    @lat = data[:boundingBox][:ul][:lat]
  end

  def format_town(data)
    "#{data[:adminArea5]}, #{data[:adminArea3]}"
  end
end
