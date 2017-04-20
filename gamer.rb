class Gamer
  attr_accessor :name, :money, :cards

  def initialize(*name)
    @name = name
    @money = 100
    @cards = []
  end

  # get two or one cards form deck
  def cards=(card)
    @cards << card
    @cards.flatten!(1)
  end
end
