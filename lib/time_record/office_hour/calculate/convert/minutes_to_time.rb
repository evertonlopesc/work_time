module Lib
  module TimeRecord
    module Calculate
      module Convert
        module MinutesToTime
          HOUR = 60

          def self.call(time:)
            if (time / HOUR).positive?
              hour = (time / HOUR)
              minutes = time % HOUR

              return Time.parse("#{hour}:#{minutes}:00").strftime '%H:%M'
            end

            Time.parse("00:#{time}:00").strftime '%H:%M'
          end
        end
      end
    end
  end
end
