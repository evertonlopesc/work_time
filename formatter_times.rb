# frozen_string_literal: true

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
  end

  def separing_times
    @times[:entrance] = @times[:entrance].split(':')
    @times[:lunch] = @times[:lunch].split(':')
    @times[:return_lunch] = @times[:return_lunch].split(':')
    @times[:stop] = @times[:stop].split(':')
    @times[:return_stop] = @times[:return_stop].split(':')
  end

  def converting_to_integer
    @times[:entrance] = @times[:entrance].map(&:to_i)
    @times[:lunch] = @times[:lunch].map(&:to_i)
    @times[:return_lunch] = @times[:return_lunch].map(&:to_i)
    @times[:stop] = @times[:stop].map(&:to_i)
    @times[:return_stop] = @times[:return_stop].map(&:to_i)
  end
end
