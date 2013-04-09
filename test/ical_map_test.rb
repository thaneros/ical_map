require 'test/unit'
require 'ical_map'

class IcalMapTest < Test::Unit::TestCase
  def test_read_calendars_from_file
    assert ((IcalMap::IcalUtils.get_calendars_from_file "test/fixtures/TerrificTerrariums.ics").first.class.eql? Icalendar::Calendar), "The object read should be a Calendar but is not one"
  end

  def test_assign_calendar_event_from_calendar
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
    assert_equal cal.events.first.summary, my_event.title
    assert_equal cal.events.first.description, my_event.description
    assert_equal cal.events.first.location, my_event.location
    assert_equal cal.events.first.dtstart, my_event.dtstart
    assert_equal cal.events.first.dtend, my_event.dtend
    assert_equal 21.3131117, my_event.lat
    assert_equal -157.8294964, my_event.lng
  end

  def test_assign_multiple_calendar_events_from_file
    assert ((IcalMap::IcalUtils.get_events_from_file "test/fixtures/MultipleEventsCalendar.ics").first.class.eql? IcalMap::Event), "The object read should be a Event but is not one"
  end

  def test_lat_lng_are_retrieved_from_location
    event = (IcalMap::IcalUtils.get_events_from_file "test/fixtures/TerrificTerrariums.ics").first
    assert_equal 21.3131117, event.lat
    assert_equal -157.8294964, event.lng
  end
end