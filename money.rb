require 'money'
require 'money/bank/google_currency'

Money.default_bank = Money::Bank::GoogleCurrency.new
Money.use_i18n = false

# puts "Las tasas hoy son: "
# puts "  Dolar: #{Money.new(100, :USD).exchange_to(:COP).format}"
# puts "  Euro: #{Money.new(100, :EUR).exchange_to(:COP).format}"
# puts "  Rublo #{Money.new(100, :RUB).exchange_to(:COP).format}"

puts "Bienvenido a Convemoney"
puts
puts "Ejemplos: "
puts "2000 USD a COP"
puts "1 RUB a COP"
puts
puts ">"

str = gets.chomp.strip

# 2000 USD A EUR

tokens = str.split(' ')
amount  = tokens[0].to_f
origin_cur = tokens[1]
target_cur = tokens[3]

currency =  Money::Currency.wrap(origin_cur)
money = Money.new(amount * currency.subunit_to_unit, origin_cur)
result = money.exchange_to(target_cur)

puts
puts "#{money.format} #{origin_cur} = #{result.format} #{target_cur}"
