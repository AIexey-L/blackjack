require_relative 'deck'
require_relative 'gamer'
require_relative 'ai'
require_relative 'who_win'
require_relative 'score_count'
require 'pry'

class Main
  include Ai
  include WhoWin
  include ScoreCount

  attr_accessor :bank, :human, :computer

  def initialize(*name)
    @human = Gamer.new(name)
    @computer = Gamer.new
    @deck = Deck.new
    @bank = 0
  end

  def game_start
    human.cards = @deck.get_two_cards
    computer.cards = @deck.get_two_cards
    money_per_round(@human)
    money_per_round(@computer)
  end

  def add_card(gamer)
    unless gamer.cards.count == 2
      raise "\nYou already have three cards, "\
      'you have to open cards'
    end
    gamer.cards << @deck.get_card.flatten(1)
    if_lose(gamer)
  end

  def status_human
    "\n#{@human.name.join}, you have cards : "\
    "#{gamer_cards(human).join(' ')} - its #{score(human.cards)} score"
  end

  def open_status_computer
    "\nComputer has cards : #{gamer_cards(computer).join(' ')}"\
    "  - its #{score(computer.cards)} score"
  end

  def closed_status_computer
    "\nComputer has cards : #{closed_cards(computer).join('  ')}"
  end

  def closed_cards(gamer)
    gamer.cards.map { '*' }
  end

  def gamer_cards(gamer)
    gamer.cards.map(&:first)
  end

  def money_per_round(gamer)
    gamer.money -= 10
    @bank += 10
  end

  def next_round
    draw? ? @bank : @bank = 0
    @deck = Deck.new
    human.cards.clear
    computer.cards.clear
    game_start
    puts status_human
    puts closed_status_computer
  end

  def open_cards
    puts status_human
    puts open_status_computer
    who_win
  end
end
