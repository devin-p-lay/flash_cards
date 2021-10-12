require './lib/deck'
require './lib/turn'
require './lib/card'

RSpec.describe Deck do
  before :each do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards  = [@card1, @card2, @card3]
    @deck   = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_a Deck
  end

  it 'has readable attributes' do
    expect(@deck.cards).to eq(@cards)
  end

  describe '#count' do
    it 'can return the count of cards' do
      expect(@deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'can return cards of a particular category' do
      expect(@deck.cards_in_category(:STEM)).to eq([@card2, @card3])
      expect(@deck.cards_in_category(:Geography)).to eq([@card1])
      expect(@deck.cards_in_category("Pop Culture")).to eq([])
    end 
  end
end

