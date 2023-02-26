# frozen_string_literal: true

require_relative 'register/entry'
require_relative 'register/pause'
require_relative 'office_hour/times'

module Lib
  module TimeRecord
    class Record
      attr_accessor :username, :entry, :lunch, :return_lunch, :stop, :return_stop

      private :username=, :entry=, :lunch=, :return_lunch=, :stop=, :return_stop=

      def initialize(username:)
        self.username = username
        self.entry = ''
        self.lunch = ''
        self.return_lunch = ''
        self.stop = ''
        self.return_stop = ''
      end

      def display_hours_worked
        times = OfficeHour::Times.new(times: list_times)

        times.call
      end

      def list_times
        { username:, entry:, lunch:, return_lunch:, stop:, return_stop: }
      end

      def to_start
        self.entry = Register::Entry.call
      end

      def lunch_break(response:)
        return self unless ['yes', 'y'].include?(response)

        self.lunch        = Register::Pause.lunch
        self.return_lunch = Register::Pause.return(event: 'lunch')
      end

      def emergency_stop(response:)
        return self unless ['yes', 'y'].include?(response)

        self.stop         = Register::Pause.emergency_stop
        self.return_stop  = Register::Pause.return(event: 'emergency stop')
      end
    end
  end
end
