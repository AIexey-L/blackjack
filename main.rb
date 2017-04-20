require_relative 'deck'
require_relative 'gamer'
require_relative 'ai'
require_relative 'who_win'
require 'pry'

class Main

  include Ai
  include WhoWin
  
  attr_accessor :bank, :human, :computer
  
  def initialize(*name)
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
    raise "\nyou already have three cards" unless gamer.cards.count == 2
    gamer.cards << @deck.card_from_deck
    if_lose(gamer)
  end
  
  def status_human
    "\n#{@human.name.join}, you have cards : #{gamer_cards(@human).join(' ')} - its #{score(@human)} score"
  end

  def open_status_computer
    "\nComputer has cards : #{gamer_cards(@computer).join(' ')}  - its #{score(@computer)} score"
  end

  def closed_status_computer
    "\nComputer has cards : #{closed_cards(@computer).join('  ')}"
  end
  
  def closed_cards(gamer)
    gamer.cards.map { '*' }
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

  def next_round
    draw? ? @bank : @bank = 0
    @deck = Deck.new
    human.cards.clear
    computer.cards.clear
    game_start
    binding.pry
    puts status_human
    puts closed_status_computer
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

