class MunchiesSerializer

  def self.format_munchies(business, current)
    {
      data: {
        id: "null",
        type: "munchie",
        attributes: {
          destination_city: business.city,
          forecast: {
            summary: current.conditions,
            temperature: "#{current.temperature}"
          },
          restaurant: {
            name: business.name,
            address: business.address
          }
        }
      }
    }
  end
end
