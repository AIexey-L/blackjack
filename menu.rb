require_relative 'main'
require 'pry'

class Menu
  attr_reader :input, :game

  def menu
    puts "\n--- MENU ---\n\nenter number:\n\n1 - start new game"
    puts "2 - get card\n3 - pass"
    puts "4 - open cards\n5 - show my money"
    puts "6 - show bank\n7 - continue game to next round"
    puts '0 - exit'
    @input = gets.chomp.to_i
  end

  def menu_game_start
    puts '--- enter your name ---'
    name = gets.chomp
    @game = Main.new(name)
    game.game_start
    puts game.status_human
    puts game.closed_status_computer
  end

  def menu_add_card
    begin
      game.add_card(game.human)
      puts game.status_human if game.score(game.human) <= 21
    rescue RuntimeError => e
      puts "#{e.message}"
      puts "\ntry again"
    end
    return game.computer_turn if game.score(game.human) <= 21 &&
                                 game.computer.cards.count == 2
    game.reset_deck
  end

  def menu_pass
    puts "\n--- passing your turn ---"
    return game.computer_turn if game.human.cards.count == 2
  end

  def menu_open_cards
    puts "\n--- opening cards! ---\n"
    game.open_cards
  end

  menu = Menu.new
  loop do
    menu.menu
    break if menu.input.zero?
    case menu.input
    when 1
      menu.menu_game_start
    when 2
      menu.menu_add_card
    when 3
      menu.menu_pass
    when 4
      menu.menu_open_cards
    when 5
      puts "\nNow you have money = #{menu.game.human.money}"
    when 6
      puts "\nMoney in bank = #{menu.game.bank}"
    when 7
      menu.game.next_round
    end
  end
end
