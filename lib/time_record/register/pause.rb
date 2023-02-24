# frozen_string_literal: true

module Lib
  module TimeRecord
    module Register
      module Pause
        def self.lunch
          print 'Inform your departure for lunch: '
          gets.chomp
        end

        def self.emergency_stop
          print 'Enter your emergency stop exit: '
          gets.chomp
        end

        def self.return(event:)
          print "Inform your return from #{event}: "
          gets.chomp
        end
      end
    end
  end
end
