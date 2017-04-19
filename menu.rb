require_relative 'main'
require_relative 'ai'

puts "*** enter your name ***"
  name = gets.chomp
  game = Main.new(name)

loop do
  puts "\n*** MENU ***\n\nenter number:\n\n1 - start game"
  puts "2 - get card\n3 - pass"
  puts "4 - open cards\n5 - show my money"
  puts "6 - show bank"
  puts '0 - exit'
  input = gets.chomp.to_i
  break if input.zero?

  case input
  when 1
    game.game_start
    # binding.pry
    puts game.status_human
    puts  game.closed_status_computer

  when 2
    begin
      game.add_card(game.human)
      # binding.pry
      puts game.status_human
    rescue RuntimeError => e
      puts "#{e.message}"
      puts "\ntry again"
    end
    game.computer_turn
    
  when 3
    puts "*** passing your turn ***"
    puts game.status_human
    game.closed_status_computer
    computer_turn
    
  when 4
    puts "*** opening cards! ***"
    binding.pry
    p game.status_human
    p game.open_status_computer
    
  end
end

