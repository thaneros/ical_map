class IcalMap
  def self.get_map (file = nil)
    if !file.nil?
      IcalMap::IcalUtils.get_events_from_file file
    end
  end
end

require 'ical_map/ical_utils'
require 'ical_map/event'