require_relative 'pause'
require_relative 'convert/minutes_to_time'

module Lib
  module TimeRecord
    module Calculate
      module EmergencyStop
        HOUR = 60
        HOUR_IN_SECONDS = 3600

        def self.call(stop:, return_stop:)
          Convert::MinutesToTime.call(
            time: Pause.call(starting: stop, returning: return_stop)
          )
        end
      end
    end
  end
end
