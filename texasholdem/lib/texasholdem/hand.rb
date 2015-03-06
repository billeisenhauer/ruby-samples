class Hand
  
  def initialize(cards=[])
    @cards = cards.dup
  end
  
  def take(card_or_cards)
    @cards.concat Array(card_or_cards)
  end
  
  def to_s
    @cards.join(' ')
  end
  
  private
  
    attr_reader :cards
  
end