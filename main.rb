# frozen_string_literal: true

require 'date'
require 'time'
require 'debug'
require_relative 'formatter_times'

def your_times
  options = {}

  puts 'Informe a entrada: '
  options[:entrance] = gets.chomp

  puts "CASO NÃO TENHA FEITO TODAS AS OPÇÕES BASTA APERTAR ENTER!\n"

  puts 'Informe o horário de almoço: '
  options[:lunch] = gets.chomp

  puts 'Informe o horário de retorno: '
  options[:return_lunch] = gets.chomp

  puts 'Informe o horário da parada: '
  options[:stop] = gets.chomp

  puts 'Informe o horário de retorno: '
  options[:return_stop] = gets.chomp

  options
end

# This class have responsability for calculate hour working
def init
  puts "ESCOLHA ENTRE ESSAS ALTERNATIVAS: ENTRADA, ALMOÇO, PARADA, RETORNO, SAÍDA.\N"
  options = your_times

  result = FormatterTimes.new(options)
  result.call
end

puts "APLICAÇÃO PARA CALCULAR SEU HORÁRIO DE TRABALHO\n\n"
init
