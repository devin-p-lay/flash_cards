require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

RSpec.describe Round do
  before :each do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
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

  describe '#take_turn' do
    it 'can take a turn' do
      @round.take_turn('Juneau')

      expect(@round.turns).to eq([@card1])
      expect(@round.current_card).to eq(@card2)
    end
  end

  describe '#number_correct' do
    it 'can return the number of correct answers' do
      @round.take_turn('Juneau')

      expect(@round.number_correct).to eq(1)
    end
  end
end

