# frozen_string_literal: true

require_relative 'formatter_times'
require_relative 'calculate/lunch_break'
require_relative 'calculate/emergency_stop'
require_relative 'calculate/range'
require_relative 'calculate/convert/to_time'
require_relative 'calculate/end_work'

module Lib
  module TimeRecord
    module OfficeHour
      class Times
        attr_accessor :times

        private :times=

        def initialize(times:)
          self.times = FormatterTimes.new(times).call
        end

        def call
          puts "Begin time in:  #{beginning_time} H"
          puts "Time lunch:     #{lunch_time} H"
          puts "Time stopped:   #{emergency_stop} H"
          puts "Total interval: #{interval} H"
          puts "End of work in: #{worked_hours} H"
        end

        def entry
          @entry ||= Calculate::Convert::ToTime.call(time: times[:entry])
        end

        def beginning_time
          entry.strftime('%H:%M')
        end

        def lunch
          @lunch ||= Calculate::Convert::ToTime.call(time: times[:lunch])
        end

        def return_lunch
          @return_lunch ||= Calculate::Convert::ToTime.call(time: times[:return_lunch])
        end

        def lunch_time
          Calculate::LunchBreak.call(lunch: lunch, return_lunch: return_lunch)
        end

        def stop
          @stop ||= Calculate::Convert::ToTime.call(time: times[:stop])
        end

        def return_stop
          @return_stop ||= Calculate::Convert::ToTime.call(time: times[:return_stop])
        end

        def emergency_stop
          Calculate::EmergencyStop.call(stop: stop, return_stop: return_stop)
        end

        def interval
          @interval ||= total_interval.strftime('%H:%M')
        end

        def worked_hours
          @worked_hours ||= Calculate::EndWork.call(start_time: entry, total_interval: total_interval)
        end

        private

        def total_interval
          Calculate::Range.between_times(
            lunch: lunch,
            return_lunch: return_lunch,
            stop: stop,
            return_stop: return_stop
          )
        end
      end
    end
  end
end
