class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    return 10 if ["J", "Q", "K"].include?(@value)
    return 11 if @value == "A"
    return @value
  end

  def to_s
    "#{@value}-#{@suit}"
  end
end
#
# c1 = Card.new(:heart, 3)
# c2 = Card.new(:clubs, 7)


class Deck
  attr_reader :cards

  def initialize
    @cards = []
    build_cards
  end

  def take!
    @cards.shift #se obtiene el primer elemento en ruby
  end

  private
    def build_cards
      [:clubs, :diamonds, :spades, :hearts].each do |suit|
        (2..10).each do |number|
          @cards << Card.new(suit, number)
        end
        ['J','Q','K','A'].each do |face|
          @cards << Card.new(suit, face)
      end
    end
    @cards.shuffle!
  end
end

class Hand
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def hit!
    @cards << @deck.take!
  end

  def value
    val = 0
    @cards.each do |card|
      val += card.value
    end
    val
  end

  def to_s
    str = ""
    @cards.each do |card|
      str += "#{card}         "
    end
    str.strip
  end
end

=begin
1. Repartir las cartas.
2. Preguntar al usuario si desea carta o se planta.
   Si pide carta
    si se pasa, ir al punto 4
    De lo contrario (si sigue), ir al punto 2
   Si se plata, ir la punto 3
3. Determinar el valor que tiene el repartidor
    si es menor a 17, entregarse otra carta
    si se pasa ir al punto 4
    de lo contrario ir al punto 3
    de lo contrario ir al punto 4
4. Determina el ganador.
    si el usario se paso, gana el repartido
    de lo contario gana el usuario
    si el usuario tiene más que el repartidor, gana el usuario
    de lo contario gana el repartidor
5. Volver al punto 1 (nuevo juego).
=end


#como representamos las cartas? figura y valor
#como representamos una baraja? 52 cartas
#como representamos las cartas que tiene el jugador y el repartidor?












deck = Deck.new
dealer = Hand.new(deck)
player = Hand.new(deck)

dealer.hit!
player.hit!
player.hit!

puts "Repartidor: #{dealer}"
puts "Jugador: #{player}"

puts
puts "Tu turno: "

while player.value < 21
  print "   Carta (C) o Plantas(P)"
  option = gets.chomp
    if option == "C"
      player.hit!
      puts "#{player}"
      puts
    elsif option  == "P"
      break
    end
end


if player.value <= 21
  puts
  puts "Turno del repartidor: "

  dealer.hit!
  puts "  #{dealer}"
  while dealer.value < 17
    dealer.hit!
    puts "   #{dealer}"
  end
end

puts
if player.value > 21
  puts "Perdiste :("
elsif dealer.value > 21
  puts "Ganaste :)"
elsif player.value == player.dealer
  puts "Empate :~"
elsif dealer.value > player.value
  puts "Perdiste :("
else
  puts "Ganaste :) "
end


















# deck = Deck.new
# hand = Hand.new(deck)
#
# puts "La baraja tiene #{deck.cards.length} cartas"
# puts "La mano tiene #{hand.cards.length} cartas"
#
# hand.hit!
#
# puts "La baraja tiene #{deck.cards.length} cartas"
# puts "La mano tiene #{hand.cards.length} cartas"
#
# hand.hit!
#
# puts "La baraja tiene #{deck.cards.length} cartas"
# puts "La mano tiene #{hand.cards.length} cartas"
