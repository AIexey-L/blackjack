class Gamer

  attr_accessor :score, :name, :money, :cards

  def initialize(*name)
    @name = name ||= "computer"
    @money = 100
    @cards = []
  end

  # get two or one cards form deck
  def cards=(card)
    @cards << card
  end

  # may be move to main?
  def open_cards
  end

  # able to see cards on hand for human
  def see_kards
  end

  
end
