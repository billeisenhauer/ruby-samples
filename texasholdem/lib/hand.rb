class Hand
  
  def initialize(cards=[])
    @cards = cards.dup
  end
  
  def take(card)
    @cards << card
  end
  
  def to_s
    @cards.join(' ')
  end
  
  private
  
    attr_reader :cards
  
end