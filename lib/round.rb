class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    if guess == current_card.answer
      @correct += 1
    end
    turns << current_card
    deck.cards.delete_at(0)
  end

  def number_correct
    @correct
  end

end