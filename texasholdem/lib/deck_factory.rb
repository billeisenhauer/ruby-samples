DeckSpec = Struct.new(:faces, :suits) do
  
  def number_of_cards
    faces.size * suits.size
  end
  
end

class DeckFactory
  
  def self.make_deck(deck_spec)
    cards = []
    deck_spec.suits.each do |suit|
      deck_spec.faces.each do |face|
        cards << Card.new(face, suit)
      end
    end
    Deck.new(cards)
  end
  
end