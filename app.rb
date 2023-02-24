# frozen_string_literal: true

require 'debug'
require_relative 'lib/time_record'

# This method records the working hours of users
#
# @param record [Object]
#
# @return working hours of user
def your_times(record)
  print 'Enter the job start time: '
  record.register_entry(time: gets.chomp)

  puts 'Want register lunch time? [ [y]es ] ou [ Enter ]'
  print 'R: '
  record.register_lunch(response: gets.chomp)

  puts 'Want register break time? [ [y]es ] ou [ Enter ]'
  print 'R: '
  record.register_stop(response: gets.chomp)

  system 'clear'

  record.display_hours_worked
end

# This method starting the application
def init
  print 'Enter your username: '
  time_record = Lib::TimeRecord.new(username: gets.chomp)

  your_times(time_record)
end

puts "APPLICATION TO CALCULATE YOUR WORKING HOURS\n\n"
init
