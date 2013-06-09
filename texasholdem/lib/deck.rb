class Deck
  
  FACES = %w(A K Q J 10 9 8 7 6 5 4 3 2 1)
  SUITS = %w(s h c d)
  
  def initialize(shuffles=0, faces=FACES, suits=SUITS)
    assemble(suits, faces)
    shuffles.times { shuffle }
  end
  
  def shuffle!
    shuffled_cards = []
    @cards.each do |card|
      location = rand(shuffled_cards.size + 1)
      shuffled_cards.insert(location, card)
    end
    @cards = shuffled_cards
    self
  end
  
  def deal(card_count=1)
    Array.new(card_count) { cards.shift }
  end
  
  def number_of_cards
    cards.size
  end
  
  def to_s
    @cards.join(' ')
  end
  
  private
  
    attr_reader :cards
  
    def assemble(suits, faces)
      @cards = []
      suits.each do |suit|
        faces.each do |face|
          @cards << Card.new(face, suit)
        end
      end
    end

end