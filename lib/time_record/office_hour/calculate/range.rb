# frozen_string_literal: true

require 'time'
require_relative 'pause'

module Lib
  module TimeRecord
    module Calculate
      module Range
        HOUR = 60

        def self.between_times(lunch:, return_lunch:, stop:, return_stop:)
          sum_pause = (
            Pause.call(starting: lunch, returning: return_lunch) +
            Pause.call(starting: stop, returning: return_stop)
          )

          hour = sum_pause / HOUR
          hour = '00' if hour.zero?
          minutes = sum_pause % HOUR

          Time.parse("#{hour}:#{minutes}:00")
        end
      end
    end
  end
end
