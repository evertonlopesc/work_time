# frozen_string_literal: true

require 'debug'
require_relative 'lib/time_record/record'

# This method starting the application
def init
  print 'Enter your username: '
  record = Lib::TimeRecord::Record.new(username: gets.chomp)

  print 'Enter the job start time: '
  record.to_start

  puts 'Want register lunch time? [ [y]es ] ou [ Enter ]'
  print 'R: '
  record.lunch_break(response: gets.chomp)

  puts 'Want register break time? [ [y]es ] ou [ Enter ]'
  print 'R: '
  record.emergency_stop(response: gets.chomp)

  system 'clear'

  record.display_hours_worked
end

puts "APPLICATION TO CALCULATE YOUR WORKING HOURS\n\n"
init
