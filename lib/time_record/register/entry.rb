module Lib
  module TimeRecord
    module Register
      module Entry
        def self.call
          print 'Inform the beginning of the working day: '
          gets.chomp
        end
      end
    end
  end
end
