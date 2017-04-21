module ScoreCount
  def score(gamer)
    first_or_second_ace(gamer) if gamer.cards.count == 2
    third_ace(gamer) if gamer.cards.count == 3
    separate_cards_score(gamer).sum
  end

  private

  def separate_cards_score(gamer)
    gamer.cards.map(&:last)
  end
  
  def third_ace(gamer)
    return unless separate_cards_score(gamer).pop == 11 &&
                 separate_cards_score(gamer).sum > 21
    separate_cards_score(gamer).sum - 10
  end

  def first_or_second_ace(gamer)
    return unless separate_cards_score(gamer).sum > 21
    separate_cards_score(gamer).map { |ace| ace == 11 ? 1 : ace }.sum
  end
end
