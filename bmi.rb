=begin
1.Solicitar el peso de la persona
2.Solicitar la altura
3.Calcular el IMC
4.Determinar si tiene o no sobrepeso
4.a. Si el IMC < 18.5 está baja de peso
4.a. Si el IMC esta entre 18.5 y 24.99 está normal
4.a. Si el IMC esta >= 25 está con sobrepeso
5.Imprimir el resultado
=end

print "Ingresa tu peso (kg): "

peso = gets.chomp.to_f

print "Ingresa tu altura (mts): "

altura = gets.chomp.to_f

imc = peso / altura**2


puts
print "El índice de Masa corpolar es #{imc.round(2)},  "

if imc < 18.5
puts  "Tu índice de masa es bajo"
 elsif imc < 25
puts  "Tu índice de masa esta normal"
else
  puts "Tu índice de masa es alto"
end
