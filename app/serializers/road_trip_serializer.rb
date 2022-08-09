class RoadTripSerializer

  def self.format_road_trip(trip, forecast)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: trip.start,
          end_city: trip.end,
          travel_time: trip.time,
          weather_at_eta: {
            temperature: forecast.temperature,
            conditions: forecast.conditions
          }
        }
      }
    }
  end
end
