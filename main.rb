require_relative 'deck'
require_relative 'gamer'
require_relative 'ai'
require 'pry'

class Main

  include Ai
  
  attr_reader :bank, :human, :computer
  
  def initialize(name)
    @human = Gamer.new(name)
    @computer = Gamer.new
    @deck = Deck.new
    @bank = 0
  end

  def game_start
    human.cards = @deck.two_cards_from_deck
    computer.cards = @deck.two_cards_from_deck
    money_per_round(@human)
    money_per_round(@computer)
  end

  def add_card(gamer)
    raise "you already have three cards" unless gamer.cards.count == 2
      gamer.cards << @deck.card_from_deck
  end
  
  def status_human
    "#{@human.name.join}, you have cards : #{gamer_cards(@human).join(' ')} - its #{score(self.human)} score"
  end

  def open_status_computer
    "Computer has cards : #{gamer_cards(@computer).join(' ')}  - its #{score(@computer)} score"
  end

  def closed_status_computer
    "Computer has cards : #{closed_cards(@computer).join('  ')}"
  end

  def open_cards
    # TODO add win conditions
  end
  
  # private
  
  def closed_cards(gamer)
    gamer.cards.map  { |card| card.map { |crd| '*' } }
  end
  
  def gamer_cards(gamer)
    gamer.cards.map(&:first)
  end

  def separate_cards_score(gamer)
    gamer.cards.map(&:last)
  end

  def score(gamer)
    if separate_cards_score(gamer).sum > 21
      separate_cards_score(gamer).map { |ace| ace == 11 ? 1 : ace }.sum
    else
      separate_cards_score(gamer).sum
    end
  end

  def money_per_round(gamer)
    gamer.money -= 10
    @bank +=10
  end
  
  # def pass(gamer)
  #   if gamer == @human
  #     @computer.cards=(@deck.card_from_deck)
  #   else
  #     gamer.cards=(@deck.card_from_deck)
  #   end
  # end

end


# b = Main.new("Alex")
# # binding.pry
# b.game_start
# puts  b.status_human
# puts b.open_status_computer
# puts b.closed_status_computer
# puts b.bank
# puts b.human.money
# puts b.computer.money

