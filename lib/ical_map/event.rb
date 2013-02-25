class IcalMap::Event
  attr_reader :title, :location, :time, :lat, :lng

  def initialize (calendar_event)
    @title = calendar_event.summary
    @location = calendar_event.location
    @lat = nil
    @lng = nil
    @time = calendar_event.dtstart
  end
end