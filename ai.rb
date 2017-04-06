module Ai

  def computer_turn
    begin
      add_card(app.computer) if app.send :score, @computer < 21
      puts "*** computer turn ***"
      puts "*** adding card ***"
      puts "*** open cards! ***"
      app.open_status_computer
      app.status_human
    rescue RuntimeError
      if app.send :score, @computer >= 17
        #TODO
      end
    end
  end
end
