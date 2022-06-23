# frozen_string_literal: true

class FormatterTimes
  def initialize(options)
    @times = options
  end

  def call
    entrance
    lunch
    return_lunch
    stop
    return_stop
    exit
  end

  def entrance
    return '' if @times[:entrance] == ''

    return_values 'entrada', convert_time(@times[:entrance])
  end

  def lunch
    return '' if @times[:lunch] == ''

    return_values 'almoço', convert_time(@times[:lunch])
  end

  def return_lunch
    return '' if @times[:return_lunch] == ''

    return_values 'retorno do almoço', convert_time(@times[:return_lunch])
  end

  def stop
    return '' if @times[:stop] == ''

    return_values 'parada', convert_time(@times[:stop])
  end

  def return_stop
    return '' if @times[:return_stop] == ''

    return_values('retorno da parada', convert_time(@times[:return_stop]))
  end

  def exit
    return '' if @times[:lunch] == ''

    calculating_exit convert_time @times[:return_lunch]
  end

  private

  def convert_time(time)
    Time.parse(time)
  end

  def return_values(names, time)
    hour = time.hour.to_s
    minutes = time.min.to_s
    seconds = time.sec.to_s

    hour = '00' if hour == '0'
    minutes = '00' if minutes == '0'
    seconds = '00' if seconds == '0'

    puts "Seu horário de #{names} é #{hour}:#{minutes}:#{seconds}"
  end

  def calculating_exit(time)
    hour = time.hour.to_s
    minutes = time.min.to_s
    seconds = time.sec.to_s

    hour = '00' if hour == '0'
    minutes = '00' if minutes == '0'
    seconds = '00' if seconds == '0'

    puts "Seu horário de saída é #{hour}:#{minutes}:#{seconds}"
  end
end
