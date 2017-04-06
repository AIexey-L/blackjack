require_relative 'deck'
require_relative 'gamer'

class Main

  attr_reader :bank, :human, :computer
  
  def initialize(name)
    @human = Gamer.new(name)
    @computer = Gamer.new
    @deck = Deck.new
    @bank = 0
  end

  def game_start
    @human.cards=(@deck.two_cards_from_deck)
    @computer.cards=(@deck.two_cards_from_deck)
    money_per_round(@human)
    money_per_round(@computer)
  end

  #TODO add raise exeption if gamer.cards.count != 2
  def add_card(gamer)
    begin
      gamer.cards=(@deck.card_from_deck) if gamer.cards.count == 2
  end
  
  def status_human
    "#{@human.name.join}, you have cards : #{gamer_cards(@human).join(' ')} - its #{score(@human)} score"
  end

  def open_status_computer
    "Your opponent has cards : #{gamer_cards(@computer).join(' ')}  - its #{score(@computer)} score"
  end

  def closed_status_computer
    "Your opponent has cards : #{closed_cards(@computer).join('  ')}"
  end
  
  private
  
  def closed_cards(gamer)
    gamer.cards.map  { |card| card.map { |crd| '*' } }
  end
  
  def gamer_cards(gamer)
    gamer.cards.map  { |card| card.map { |crd| crd.first } }
  end

  def score(gamer)
    gamer.cards.map {  |card| card.map { |crd| crd.last } }.flatten.sum
  end

  def money_per_round(gamer)
    gamer.money -= 10
    @bank +=10
  end

  def pass(gamer)
    if gamer == @human
      @computer.cards=(@deck.card_from_deck)
    else
      gamer.cards=(@deck.card_from_deck)
    end
  end

end


b = Main.new("Alex")
b.game_start
puts  b.status_human
puts b.open_status_computer
puts b.closed_status_computer
puts b.bank
puts b.human.money
puts b.computer.money

