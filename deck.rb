class Deck

  def initialize
    prepare_deck
    @deck = @deck_sample.map do |card|
      @siut.map { |siut| ["#{card.first}" + "#{siut}", card.last] }
    end
    @deck.flatten!(1).shuffle!
  end

  def card_from_deck
    @deck.pop
  end

  def two_cards_from_deck
    @deck.pop(2)#.flatten(1)
  end
  
  private
  
  def prepare_deck
    numbers = (2..10).to_a.map { |card| card = [card, card] }
    pics = ['J', 'Q', 'K'].map { |card| card = [card, 10] } << ['A', 11]
    @deck_sample = numbers + pics
    @siut = ["\u2661", "\u2662", "\u2667", "\u2664"]
  end

end
