require 'test/unit'
require 'ical_map'
require 'ical_map/event'

class IcalMapTest < Test::Unit::TestCase
  def test_read_calendars_from_file
    p IcalMap::IcalUtils.getCalendarsFromFile "test/TerrificTerrariums.ics"
    assert (IcalMap::IcalUtils.getCalendarsFromFile "test/TerrificTerrariums.ics").first.class.eql? Icalendar::Calendar
  end

  def test_assign_calendar_event
    my_calendar = (IcalMap::IcalUtils.getCalendarsFromFile "test/TerrificTerrariums.ics").first
    my_event = IcalMap::Event.new my_calendar.events.first
    p my_event
    assert my_event.class.eql? IcalMap::Event
  end
end