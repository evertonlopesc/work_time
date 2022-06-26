# frozen_string_literal: true

require 'date'
require 'time'
require_relative 'formatter_times'

class CalculationTime
  HOUR = 60
  HOUR_IN_SECONDS = 3600
  HOUR_WORKING = 8

  def initialize(times)
    @times = FormatterTimes.new(times).call

    @entrance     = convert_time(@times[:entrance])
    @lunch        = convert_time(@times[:lunch])
    @return_lunch = convert_time(@times[:return_lunch])
    @stop         = convert_time(@times[:stop])
    @return_stop  = convert_time(@times[:return_stop])
  end

  end


  end

  end

  def convert_time(time)
    Time.parse("#{time[:hours]}:#{time[:minutes]}:#{time[:seconds]}")
  end
end
