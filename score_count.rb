module ScoreCount
  def score(cards)
    first_or_second_ace(cards) if cards.count == 2
    third_ace(cards) if cards.count == 3
    separate_cards_score(cards).sum
  end

  private 

  def separate_cards_score(cards)
    cards.map(&:last)
  end
  
  def third_ace(cards)
    return unless separate_cards_score(cards).pop == 11 &&
                  separate_cards_score(cards).sum > 21
    separate_cards_score(cards).sum - 10
  end

  # TODO переписать условие, т.к. при двух тузах сумма будет 2
  def first_or_second_ace(cards)
    return unless separate_cards_score(cards).sum > 21
    separate_cards_score(cards).map { |ace| ace == 11 ? 1 : ace }.sum
  end
end
