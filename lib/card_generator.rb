class CardGenerator
  def initialize(file)
    @file = file
  end

  def cards
    flash_cards = File.read(@file).split("\n")

    flash_cards.map do |info|
      card_info = info.split(',')
      Card.new(card_info[0], card_info[1], card_info[2])
    end 
  end
end
