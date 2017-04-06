module Ai

  def computer_turn
    if app.send :score, @computer < 21
      add_card(app.computer)
      #TODO
    end
  end
end
