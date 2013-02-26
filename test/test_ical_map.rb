require 'test/unit'
require 'ical_map'
require 'date'
require 'icalendar'

class IcalMapTest < Test::Unit::TestCase
  def test_read_calendars_from_file
    p IcalMap::IcalUtils.getCalendarsFromFile "test/TerrificTerrariums.ics"
    assert ((IcalMap::IcalUtils.getCalendarsFromFile "test/TerrificTerrariums.ics").first.class.eql? Icalendar::Calendar), "The object read should be a Calendar but is not one"
  end

  def test_assign_calendar_event
    cal = Icalendar::Calendar.new
    cal.event do
      dtstart       Date.new(2005, 04, 29)
      dtend         Date.new(2005, 04, 28)
      summary     "Meeting with the man."
      description "Have a long lunch meeting and decide nothing..."
      location    "Hawaii Nature Center - Oahu - 2131 Makiki Heights Drive , Honolulu, HI US 96822"
    end
    cal.publish 
    my_event = IcalMap::Event.new cal.events.first
    p my_event
    assert my_event.title == cal.events.first.summary && my_event.description == cal.events.first.description && my_event.location == cal.events.first.location && my_event.dtstart == cal.events.first.dtstart &&  my_event.dtend == cal.events.first.dtend, "Event fields do not correspond to the original Calendar event fields"
  end
end