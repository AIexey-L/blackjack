require_relative 'deck'
require_relative 'gamer'

class Main

  def initialize(name)
    @human = Gamer.new(name)
    @computer = Gamer.new
    @deck = Deck.new
  end

  def game_start
    @human.cards=(@deck.two_cards_from_deck)
    @computer.cards=(@deck.two_cards_from_deck)
    # puts "Gamer #{@gamer.name} - #{@gamer.cards.flatten(1)}"
  end

  def show_status_human
    "#{@human.name.join}, you have cards : #{gamer_cards(@human).join(' ')} - its #{score(@human)} score"
  end

  def show_status_computer
    "Your opponent has cards : #{gamer_cards(@computer).join(' ')} - its #{score(@computer)} score"
  end
  
  def gamer_cards(gamer)
    gamer.cards.map do  |card|
      card.map { |crd| crd.first }
    end
  end

  def score(gamer)
    p gamer
  end
    
end


b = Main.new("Alex")
b.game_start
puts  b.show_status_human
puts b.show_status_computer
  
