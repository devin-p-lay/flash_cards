require './files'

filename = 'cards.txt'
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
quiz = Round.new(deck)

quiz.start