# frozen_string_literal: true

module Lib
  module TimeRecord
    module Calculate
      module EndWork
        HOUR = 60
        HOUR_WORKING = 8

        def self.call(start_time:, total_interval:)
          range = total_interval
          hour = start_time.hour + range.hour + HOUR_WORKING
          minutes = start_time.min + range.min

          if (minutes / HOUR).positive?
            hour += (minutes / HOUR)
            minutes = minutes % HOUR
          end

          Time.parse("#{hour}:#{minutes}:00").strftime '%H:%M'
        end
      end
    end
  end
end
