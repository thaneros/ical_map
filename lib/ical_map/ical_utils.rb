require 'icalendar'

class IcalMap::IcalUtils
  def self.getCalendarsFromFile (filename)
    cal_file = File.open(filename)
    Icalendar.parse(cal_file)
  end
end