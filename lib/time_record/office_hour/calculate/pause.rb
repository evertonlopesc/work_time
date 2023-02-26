module Lib
  module TimeRecord
    module Calculate
      module Pause
        HOUR = 60
        HOUR_IN_SECONDS = 3600

        def self.call(starting:, returning:)
          result = ((returning - starting) / HOUR_IN_SECONDS) * HOUR
          result.round 0
        end
      end
    end
  end
end
