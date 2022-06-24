# frozen_string_literal: true

require 'debug'
require_relative 'calculation_time'

def your_times
  options = {}

  print 'Informe a entrada: '
  options[:entrance] = gets.chomp

  puts "CASO NÃO TENHA FEITO TODAS AS OPÇÕES BASTA APERTAR ENTER!\n"

  print 'Informe o horário de almoço: '
  options[:lunch] = gets.chomp

  print 'Informe o horário de retorno: '
  options[:return_lunch] = gets.chomp

  print 'Informe o horário da parada: '
  options[:stop] = gets.chomp

  print 'Informe o horário de retorno: '
  options[:return_stop] = gets.chomp

  options
end

# This class have responsability for calculate hour working
def init
  puts "ESCOLHA ENTRE ESSAS ALTERNATIVAS: ENTRADA, ALMOÇO, PARADA, RETORNO, SAÍDA.\N"
  options = your_times

  system 'clear'

  result = CalculationTime.new(options)
  result.entrance
  result.lunch
  result.end_of_working_hours
end

puts "APLICAÇÃO PARA CALCULAR SEU HORÁRIO DE TRABALHO\n\n"
init
