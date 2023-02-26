require_relative 'pause'
require_relative 'convert/minutes_to_time'

module Lib
  module TimeRecord
    module Calculate
      module LunchBreak
        HOUR = 60
        HOUR_IN_SECONDS = 3600

        def self.call(lunch:, return_lunch:)
          Convert::MinutesToTime.call(
            time: Pause.call(starting: lunch, returning: return_lunch)
          )
        end
      end
    end
  end
end
