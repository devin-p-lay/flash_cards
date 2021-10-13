require_relative './flash_cards'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
    @flash_cards = FlashCards.new
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    if guess == current_card.answer
      @correct += 1
    end
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.delete_at(0)
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      turn.card.category == category
    end.count
  end

  def percent_correct
    (number_correct/turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    same_count = turns.count do |turn|
      turn.card.category == category
    end
    number_correct_by_category(category)/same_count.to_f * 100
  end

  def start
    @flash_cards.quiz
  end
end