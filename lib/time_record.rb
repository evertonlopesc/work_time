# frozen_string_literal: true

require_relative 'calculation_time'

module Lib
  class TimeRecord
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
      CalculationTime.new(list_times).call
    end

    def list_times
      {
        username:,
        entrance: entry,
        lunch:,
        return_lunch:,
        stop:,
        return_stop:
      }
    end

    def register_entry(time:)
      print 'Inform the beginning of the working day: '
      self.entry = time
    end

    def register_lunch(response:)
      return self unless %w[yes y].include?(response)

      print 'Inform your departure for lunch: '
      self.lunch = gets.chomp

      print 'Inform your return from lunch: '
      self.return_lunch = gets.chomp
    end

    def register_stop(response:)
      return self unless %w[yes y].include?(response)

      print 'Inform your departure for break: '
      self.stop = gets.chomp

      print 'Inform your return from break: '
      self.return_stop = gets.chomp
    end
  end
end
