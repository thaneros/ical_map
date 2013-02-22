require 'test/unit'
require 'ical_map'

class IcalMapTest < Test::Unit::TestCase
  def test_read_calendars_from_file
    assert (IcalMap::IcalUtils.getCalendarsFromFile "test/TerrificTerrariums.ics").first.class.eql? Icalendar::Calendar
  end
end