class IcalMap::Event
  attr_reader :title, :location, :dtstart, :dtend, :description, :lat, :lng

  def initialize (calendar_event)
    @title = calendar_event.summary
    @location = calendar_event.location
    @description = calendar_event.description
    @lat = nil
    @lng = nil
    @dtstart = calendar_event.dtstart
    @dtend = calendar_event.dtend
  end
end