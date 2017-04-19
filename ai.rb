module Ai

  def computer_turn
    puts "*** computer turn ***"
    while @computer.cards.count == 2
      if computer_score <= 16 && rand(10) <= 5
        return computer_get_card
      elsif computer_score > 15 + rand(3)
        return puts "*** computer dicides to pass!"
      elsif computer_score > 17 + rand(3)
        return computer_open
      end
    end
    
    while @computer.cards.count == 3
      if computer_score > 15 + rand(3)
        return puts "*** computer dicides to pass!"
      elsif computer_score > 17 + rand(3)
        return computer_open
      end
    end
  end

  def computer_score
    app.send :score, @computer
  end

  def computer_get_card
    puts "*** computer decides to get card ***"
    add_card(@computer)
    app.closed_status_computer
    app.status_human
  end

  def computer_open
    puts "*** computer disides to open cards! ***"
    ap.open_status_computer
    app.status_human
  end
  
end
