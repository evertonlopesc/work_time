class RefactoringZero
  def initialize(name)
    @time = name
  end

  def call
    time = {}

    time[:hours] = hours
    time[:minutes] = minutes
    time[:seconds] = seconds

    time
  end

  def hours
    return '00' if @time[0].nil? || @time[0].zero?

    @time[0]
  end

  def minutes
    return '00' if @time[1].nil? || @time[1].zero?

    @time[1]
  end

  def seconds
    return '00' if @time[2].nil? || @time[2].zero?

    @time[2]
  end
end
