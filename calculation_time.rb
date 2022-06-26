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

  def call
    puts "Begin time in   #{@entrance.strftime('%H:%M')} H"
    puts "Time lunch:    #{calculate_lunch_break} H"
    puts "Time stopped:  #{calculate_stopped_break} H"
    puts "Total interval: #{calculate_range.strftime('%H:%M')} H"
    puts "End of work in: #{calculate_end_work} H"
  end

  private

  def calculate_lunch_break
    lunch = total_pause @lunch, @return_lunch
    convert_minutes_to_time(lunch)
  end

  def calculate_stopped_break
    stopped = total_pause @stop, @return_stop
    convert_minutes_to_time(stopped)
  end

  def calculate_range
    sum_pause = total_pause(@lunch, @return_lunch) + total_pause(@stop, @return_stop)
    hour = sum_pause / HOUR
    hour = '00' if hour.zero?
    minutes = sum_pause % HOUR

    Time.parse("#{hour}:#{minutes}:00")
  end

  def calculate_end_work
    range = calculate_range
    hour = @entrance.hour + range.hour + HOUR_WORKING
    minutes = @entrance.min + range.min

    if (minutes / HOUR).positive?
      hour += (minutes / HOUR)
      minutes = minutes % HOUR
    end

    Time.parse("#{hour}:#{minutes}:00").strftime '%H:%M'
  end

  def total_pause(starting, returning)
    result = ((returning - starting) / HOUR_IN_SECONDS) * HOUR
    result.round 0
  end

  def convert_minutes_to_time(time)
    if (time / HOUR).positive?
      hour = (time / HOUR)
      minutes = time % HOUR

      return Time.parse("#{hour}:#{minutes}:00").strftime '%H:%M'
    end

    Time.parse("00:#{time}:00").strftime '%H:%M'
  end

  def convert_time(time)
    Time.parse("#{time[:hours]}:#{time[:minutes]}:#{time[:seconds]}")
  end
end
