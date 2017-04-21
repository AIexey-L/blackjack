module WhoWin
  def who_win
    if score(@human) > score(@computer) && score(@human) <= 21
      puts "\n--- Congratulations! You win! ---"
      human.money += @bank
    elsif score(@human) < score(@computer) && score(@computer) <= 21
      puts "\n--- Computer wins! ---"
      computer.money += @bank
    elsif draw?
      puts "\n--- Draw! ---"
    else
      puts "\n--- You lose! ---"
    end
    show_money
    @bank = 0
    reset_deck
  end

  def if_lose(gamer)
    return unless score(gamer) > 21
    puts "\n--- You lose! ---" if gamer == human
    puts "\n--- Computer loses ---" if gamer == computer
    puts status_human
    puts open_status_computer
    money_to_winner(gamer)
    show_money
    @bank = 0
  end

  def reset_deck
    @deck = Deck.new
    human.cards.clear
    computer.cards.clear
  end

  def money_to_winner(gamer)
    computer.money += @bank if gamer == human
    human.money += @bank if gamer == computer
    @bank = 0
  end

  def show_money
    puts "\nNow you have money = #{human.money}"
    puts "\nComputer has money = #{computer.money}"
  end

  private

  def draw?
    score(@human) == score(@computer) &&
      score(@human) <= 21 &&
      score(@computer) <= 21
  end
end
