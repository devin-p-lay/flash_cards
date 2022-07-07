require './lib/card'

RSpec.describe Card do
  before do
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
  end

  it 'exists' do
    expect(@card).to be_a Card
  end

  it 'has readable attributes' do
    expect(@card.answer).to eq('Juneau')
    expect(@card.category).to eq(:Geography)
    expect(@card.question).to eq('What is the capital of Alaska?')
  end
end
