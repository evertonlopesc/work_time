# frozen_string_literal: true

require 'date'
require 'time'
require_relative 'formatter_times'
require_relative 'refactoring_zero'

class CalculationTime
  def initialize(times)
    @times = FormatterTimes.new(times).call
  end

  def entrance
    entrance = convert_time @times[:entrance]
    puts "Iniciou o trabalho às #{entrance.strftime '%H:%M:%S'} horas"
  end

  def lunch
    lunch = convert_time @times[:lunch]
    puts "Saiu para almoçar às #{lunch.strftime '%H:%M:%S'} horas"
  end

  def return_lunch
    return_lunch = convert_time @times[:return_lunch]
    puts "Retornou do almoçar às #{lunch.strftime '%H:%M:%S'} horas"
  end

  def end_of_working_hours
    hour = @times[:entrance][0] + 9
    minutes = @times[:entrance][1]

    puts "Fim do expediente às #{hour}:#{minutes} horas"
  end

  private

  def refactoring_when_zero(time)
    RefactoringZero.new(time).call
  end

  def convert_time(time)
    time = refactoring_when_zero time

    Time.parse("#{time[:hours]}:#{time[:minutes]}:#{time[:seconds]}")
  end
end
