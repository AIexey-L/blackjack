class Deck

  attr_accessor :card, :deck

  @@deck_sample = [(2..10).to_a, 'J', 'Q', 'K', 'A'].flatten
  p @@deck_sample
  # 2661 - Heart, 2662 - Diamond, 2667 - Club, 2664 - Spade
  @@siut = ["\u2661", "\u2662", "\u2667", "\u2664"]
  p @@siut
  
  def initialize
    @deck = @@deck_sample.map do |card|
      @@siut.map { |siut| "#{card}" + "#{siut}" }
    end
    @deck.flatten!.shuffle!
  end
  

end

a = Deck.new
puts a.deck

# TODO: make deck as a hash { "card + siut" => value }
# or array ['card siute', value]
