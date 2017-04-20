module Ai

  def computer_turn
    puts "\n--- computer turn ---"
    while @computer.cards.count == 2
      if score(@computer) <= 16 && rand(10) <= 5
        return computer_get_card
      elsif score(@computer) > 15 + rand(3)
        return puts "\n--- computer dicides to pass!"
      elsif score(@computer) > 15 + rand(3)
        return computer_open
      end
    end
    
    while @computer.cards.count == 3
      if score(@computer) > 15 + rand(3)
        return puts "\n--- computer dicides to pass!"
      elsif score(@computer) > 17 + rand(3)
        return computer_open
      end
    end
  end

  def computer_get_card
    puts "\n--- computer decides to get card ---"
    self.add_card(self.computer)
    # binding.pry
    puts self.closed_status_computer
    puts self.status_human
  end

  def computer_open
    puts "\n--- computer disides to open cards! ---"
    puts self.open_status_computer
    puts self.status_human
    self.who_win
  end
  
end
