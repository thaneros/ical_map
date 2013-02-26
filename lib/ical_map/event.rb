class IcalMap::Event
  attr_reader :title, :location, :dtstart, :dtend, :description, :lat, :lng

  def initialize (calendar_event)
    @title = calendar_event.summary
    @location = calendar_event.location
    @description = calendar_event.description
    get_lat_lng_from_location location
    @dtstart = calendar_event.dtstart
    @dtend = calendar_event.dtend
  end

  def get_lat_lng_from_location (location)
    location_found = false
    RestClient.get("http://maps.googleapis.com/maps/api/geocode/json", {:params =>  {:address => location, :sensor => "false"}}) do |response, request, result, &block|
      case response.code
      when 200
        resh = JSON.parse response
        if resh["status"] == "OK"
          @lat = resh["results"][0]["geometry"]["location"]["lat"]
          @lng = resh["results"][0]["geometry"]["location"]["lng"]
          location_found = true
        end
      end
    end
    return location_found
  end
end

require 'rest_client'
require 'json'