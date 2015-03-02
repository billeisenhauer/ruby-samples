class Card
  
  attr_reader :face, :suit
  
  def initialize(face, suit)
    @face = face
    @suit = suit
  end
  
  def to_s
    "#{face}#{suit}"
  end
  
  def ==(other)
    (face == other.face) && (suit == other.suit)
  end
  
end