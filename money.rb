require 'money'
require 'money/bank/google_currency'

Money.default_bank = Money::Bank::GoogleCurrency.new
Money.use_i18n = false

puts "Las tasas hoy son: "
puts "  Dolar: #{Money.new(100, :USD).exchange_to(:COP).format}"
puts "  Euro: #{Money.new(100, :EUR).exchange_to(:COP).format}"
puts "  Rublo #{Money.new(100, :RUB).exchange_to(:COP).format}"
