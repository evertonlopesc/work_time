# frozen_string_literal: true

require 'debug'
require_relative 'calculation_time'

def your_times
  options = {}

  print 'Inform the beginning of the working day: '
  options[:entrance] = gets.chomp

  puts "\nIF YOU HAVE NOT DONE ALL THE OPTIONS JUST PRESS ENTER!\n\n"

  print 'Inform your departure for lunch: '
  options[:lunch] = gets.chomp

  print 'Inform your return from lunch: '
  options[:return_lunch] = gets.chomp

  print 'Inform your emergency stop: '
  options[:stop] = gets.chomp

  print 'Inform your return to the emergency stop: '
  options[:return_stop] = gets.chomp

  options
end

# This class have responsability for calculate hour working
def init
  options = your_times

  system 'clear'

  CalculationTime.new(options).call
end

puts "APPLICATION TO CALCULATE YOUR WORKING HOURS\n\n"
init
