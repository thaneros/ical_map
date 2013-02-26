require 'icalendar'

class IcalMap::IcalUtils
  def self.get_calendars_from_file (filename)
    cal_file = File.open(filename)
    Icalendar.parse(cal_file)
  end

  def self.get_events_from_file (filename)
    events = Array.new
    calendars = get_calendars_from_file filename
    calendars.each do |calendar|
      calendar.events.each do |event|
        events.push(IcalMap::Event.new event)
      end
    end
    return events
  end
end