require_relative 'main'

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
    # game.human.name= name
    game.game_start
    # binding.pry
    puts game.status_human
    puts game.closed_status_computer
  end

  def menu_add_card
    begin
      game.add_card(game.human)
      puts game.status_human
    rescue RuntimeError => e
      puts "#{e.message}"
      puts "\ntry again"
    end
    game.computer_turn
  end

  def menu_pass
    puts "\n--- passing your turn ---"
    puts game.status_human
    puts game.closed_status_computer
    game.computer_turn
  end

  def menu_open_cards
    puts "\n--- opening cards! ---\n"
    puts game.status_human
    puts game.open_status_computer
    game.who_win
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
