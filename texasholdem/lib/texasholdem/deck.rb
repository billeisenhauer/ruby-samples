class Deck
  
  def initialize(cards)
    self.cards = cards
  end
  
  def shuffle
    shuffled_cards = []
    cards.each do |card|
      location = rand(shuffled_cards.size + 1)
      shuffled_cards.insert(location, card)
    end
    Deck.new(shuffled_cards)
  end
  
  def deal(card_count=1)
    Array.new(card_count) { cards.shift }
  end
  
  def number_of_cards
    cards.size
  end
  
  def to_s
    cards.join(' ')
  end
  
  private
  
    attr_accessor :cards

end