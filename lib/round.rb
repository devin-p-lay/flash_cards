require_relative './turn'

class Round
  attr_reader :deck,
              :turns,
              :counter,
              :correct

  def initialize(deck)
    @counter = 1
    @deck = deck
    @turns = []
    @correct = 0
    @card_count = deck.count
  end

  def start
    start_message

    until deck.count == 0
      show_card_and_take_user_guess
    end

    gameover
  end

  def start_message
    puts "Welcome! You will be answering #{@card_count} questions."
    puts '--------------------------------------------'
  end

  def show_card_and_take_user_guess
    puts "\nThis is question #{@counter} out of #{@card_count}"
    puts "Question: #{current_card.question}"

    guess = gets.chomp
    turn = take_turn(guess)
    puts turn.feedback
    @counter += 1
  end


  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @correct += 1 if current_turn.correct?
    turns << current_turn
    deck.cards.shift
    current_turn
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      turn.card.category == category && turn.guess == turn.card.answer
    end.count
  end

  def percent_correct
    ((number_correct / turns.count.to_f) * 100).round(2)
  end

  def percent_correct_by_category(category)
    same_count = turns.count do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category) / same_count.to_f * 100).round(2)
  end

  def gameover
    puts "\n                  ----- GAME OVER -----"
    puts "You had #{number_correct} correct guesses out of #{@turns.size} for a total score of #{percent_correct}%."
    puts "\n"

    categories = @turns.map do |turn|
      turn.card.category
    end

    categories.uniq.each do |category|
      puts "       #{category} - #{percent_correct_by_category(category)}% correct."
    end

    puts "\n              ----- Thank you for playing -----\n"
  end
end








