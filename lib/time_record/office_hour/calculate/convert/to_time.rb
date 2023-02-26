# frozen_string_literal: true

module Lib
  module TimeRecord
    module Calculate
      module Convert
        module ToTime
          def self.call(time:)
            Time.parse("#{time[:hours]}:#{time[:minutes]}:#{time[:seconds]}")
          end
        end
      end
    end
  end
end
