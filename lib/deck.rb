class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    same = []
    cards.map do |card|
      same << card if card.category == category
    end
    same
  end
end
