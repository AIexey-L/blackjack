class Deck

  def initialize
    deck_template
    @deck = @deck_sample.map do |card|
      @siut.map { |siut| [card.first.to_s + siut.to_s, card.last] }
    end
    @deck.flatten!(1).shuffle!
  end

  def get_card
    get_cards
  end

  def get_two_cards
    get_cards(2)
  end

  private

  def deck_template
    numbers = (2..10).to_a.map { |card| [card, card] }
    pics = %w(J, Q, K).map { |card| [card, 10] } << ['A', 11]
    @deck_sample = numbers + pics
    @siut = ["\u2661", "\u2662", "\u2667", "\u2664"]
  end

  def get_cards(q = 1)
    @deck.pop q
  end
end
