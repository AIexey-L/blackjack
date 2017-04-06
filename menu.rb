require_relative 'main'
require_relative 'ai'

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
      puts "*** enter your name ***"
      name = gets.chomp
      app = Main.new(name)
      game_start
      app.status_human
      app.closed_status_computer

    when 2
      begin
        add_card(app.human)
        app.status_human
      rescue RuntimeError => e
        puts "#{e.message}"
        puts "\ntry again"
      end

    when 3
      puts "*** passing your turn ***"
      pass(app.human)
      app.status_human
      app.closed_status_computer

    when 4
      puts "*** opening cards ***"
      app.status_human
      app.open_status_computer
      
    end
  end
