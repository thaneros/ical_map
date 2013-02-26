class IcalMap
  def self.hi
    IcalMap::IcalUtils.getCalendarsFromFile "/home/benjamin/Downloads/TerrificTerrariums.ics"
  end
end

require 'ical_map/ical_utils'
require 'ical_map/event'