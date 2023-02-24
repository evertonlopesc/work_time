# frozen_string_literal: true

require_relative 'refactoring_zero'

module Lib
  class FormatterTimes
    def initialize(options)
      @times = options
    end

    def call
      refactoring_time
      @times
    end

    private

    def refactoring_time
      separing_times
      converting_to_integer
      identifing_hour_minutes
    end

    def separing_times
      @times[:entry] = @times[:entry].split(':')
      @times[:lunch] = @times[:lunch].split(':')
      @times[:return_lunch] = @times[:return_lunch].split(':')
      @times[:stop] = @times[:stop].split(':')
      @times[:return_stop] = @times[:return_stop].split(':')
    end

    def converting_to_integer
      @times[:entry] = @times[:entry].map(&:to_i)
      @times[:lunch] = @times[:lunch].map(&:to_i)
      @times[:return_lunch] = @times[:return_lunch].map(&:to_i)
      @times[:stop] = @times[:stop].map(&:to_i)
      @times[:return_stop] = @times[:return_stop].map(&:to_i)
    end

    def refactoring_when_zero(time)
      RefactoringZero.new(time).call
    end

    def identifing_hour_minutes
      times = @times
      @times[:entry]     = refactoring_when_zero times[:entry]
      @times[:lunch]        = refactoring_when_zero times[:lunch]
      @times[:return_lunch] = refactoring_when_zero times[:return_lunch]
      @times[:stop]         = refactoring_when_zero times[:stop]
      @times[:return_stop]  = refactoring_when_zero times[:return_stop]
    end
  end
end
