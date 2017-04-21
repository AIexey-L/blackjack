module Ai
  def computer_turn
    puts "\n--- computer turn ---"
    while @computer.cards.count == 2
      return computer_get_card if score(@computer) <= 16 && rand(10) <= 5
      return puts "\n--- computer dicides to pass!" if score(@computer) > 15 + rand(3)
      return computer_open if score(@computer) > 14 + rand(2)
    end
    open_cards while @computer.cards.count == 3
  end

  def computer_get_card
    puts "\n--- computer decides to get card ---"
    add_card(@computer)
    return open_cards if computer.cards.count == 3 && score(@computer) <= 21
    closed_cards(@computer)
  end

  def computer_open
    puts "\n--- computer disides to open cards! ---"
    open_cards
  end
  
end
