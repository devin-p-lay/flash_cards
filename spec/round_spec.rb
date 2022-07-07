require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

RSpec.describe Round do
  before do
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    @card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    @deck  = Deck.new([@card1, @card2, @card3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_a Round
  end

  it 'has readable attributes' do
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  describe '#current_card' do
    it 'can return the current card' do
      expect(@round.current_card).to eq(@card1)
    end
  end

  describe 'new_turn' do
    it 'can take a new turn' do
      new_turn = Turn.new('Juneau', @card1)

      expect(new_turn).to be_a Turn
      expect(new_turn.correct?).to be true
    end
  end

  describe '#take_turn' do
    it 'can take a turn' do
      @round.take_turn('Juneau')

      expect(@round.turns).to be_an Array
      expect(@round.current_card).to eq(@card2)

      @round.take_turn('Venus')
      expect(@round.turns.count).to eq(2)
      expect(@round.turns.last.feedback).to eq('Incorrect.')
      expect(@round.number_correct).to eq(1)
      expect(@round.current_card).to eq(@card3)
    end
  end

  describe '#number_correct' do
    it 'can return the number of correct answers' do
      @round.take_turn('Juneau')

      expect(@round.number_correct).to eq(1)
    end
  end

  describe '#number_correct_by_category' do
    it 'can return the number correct of a certain category' do
      @round.take_turn('Juneau')

      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'can return the percentage correct' do
      @round.take_turn('Juneau')
      @round.take_turn('Venus')

      expect(@round.percent_correct).to eq(50.0)
    end
  end

  describe '#percent_correct_by_category' do
    it 'can return percentage of correct within a category' do
      @round.take_turn('Juneau')
      @round.take_turn('Venus')

      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
  end
end
