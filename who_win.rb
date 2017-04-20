module WhoWin
  def who_win
    if score(@human) > score(@computer) && score(@human) < 21
      puts "\n--- Congratulations! You win! ---"
      human.money += @bank
    elsif score(@human) < score(@computer) && score(@computer) < 21
      puts "\n--- Computer wins! ---"
      computer.money += @bank
    elsif draw?
      puts "\n--- Draw! ---"
    else
      puts "\n--- You lose! ---"
    end
    puts "\nNow you have money = #{human.money}"
    puts "\nComputer has money = #{computer.money}"
  end

  def if_lose(gamer)
    return unless score(gamer) > 21
    puts "\n--- You lose! ---"
    puts status_human
    puts open_status_computer
    @deck = Deck.new
    human.cards.clear
    computer.cards.clear
    computer.money += @bank if gamer == human
    human.money += @bank if gamer == computer
    @bank = 0
  end

  private

  def draw?
    score(@human) == score(@computer) &&
      not_lose?(@human) &&
      not_lose?(@computer)
  end
end
