require './lib/round'
require './lib/deck'
require './lib/card'

card1 = Card.new("What do you use to iterate over a collection?", "enumerable", :iteration)
card2 = Card.new("true/false: @instance_variables have a GLOBAL SCOPE?", "true", :scope)
card3 = Card.new("What data type contains a list of elements?", "array", :collections)
card4 = Card.new("What enumerable do you use to find the sum a collection?", ".sum", :iteration)
card5 = Card.new("true/false: local_variables have a GLOBAL SCOPE?", "false", :scope)
card6 = Card.new("What is it called when you have an array inside of an array?", "nested collection", :collections)
card7 = Card.new("If you can't remember an certain enumberable, what will alway work?", ".each", :iteration)
card8 = Card.new("true/false: Methods have a global scope to to the Class in which they exist?", "true", :scope)
card9 = Card.new("What built-in Ruby method allows you to turn a nested collection back into an array", "flatten", :collections)
card10 = Card.new("What does 'TDD' stand for?", "test driven developement", :convention)
cards_mod1 = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10]
mod1 = Deck.new(cards_mod1)

quiz = Round.new(mod1)
quiz.start





# require './lib/card_generator'
#
# filename = 'cards.txt'
#
# cards = CardGenerator.new(filename).cards
# require "pry"; binding.pry