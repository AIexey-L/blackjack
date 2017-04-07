module Ai

  def computer_turn
    begin
      add_card(app.computer) if computer_score < 21
      puts "*** computer turn ***"
      puts "*** adding card ***"
      puts "*** open cards! ***"
      app.open_status_computer
      app.status_human
    rescue RuntimeError

      while @computer.cards.count == 2
        if computer_score <= 16 && rand(10) <= 5
          #return add card
        elsif computer_score > 15 + rand(3)
          #return pass
        elsif computer_score > 17 + rand(3)
          #return open
        end
      end

      while @computer.cards.count == 3
        if computer_score > 15 + rand(3)
          #return pass
        elsif computer_score > 17 + rand(3)
          #return open
        end
    end
  end

    def computer_score
      app.send :score, @computer
    end

    def add_card_computer
      
    end
    
end
