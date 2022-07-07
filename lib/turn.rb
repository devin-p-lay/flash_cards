class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card  = card
  end

  def correct?
    true if @guess.downcase.include?(@card.answer.downcase)
  end

  def feedback
    if correct?

      '*** Correct! ***'
    else
      '*** Incorrect ***'
    end
  end
end
