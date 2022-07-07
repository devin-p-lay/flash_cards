require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before do
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn = Turn.new('Juneau', @card)
  end

  it 'exist' do
    expect(@turn).to be_a Turn
  end

  it 'has readable attributes' do
    expect(@turn.card).to eq(@card)
    expect(@turn.guess).to eq('Juneau')
  end

  describe '#correct?' do
    it 'can tell if the guess is correct' do
      expect(@turn.correct?).to be true
    end
  end

  describe '#feedback' do
    it 'can return feedback to the terminal' do
      expect(@turn.feedback).to eq('Correct!')

      @card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
      @turn = Turn.new('Saturn', @card)

      expect(@turn.feedback).to eq('Incorrect.')
    end
  end
end
