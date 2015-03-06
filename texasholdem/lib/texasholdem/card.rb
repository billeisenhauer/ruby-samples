class Card
  
  attr_reader :face, :suit
  
  def initialize(face, suit)
    self.face = face
    self.suit = suit
  end
  
  def to_s
    "#{face}#{suit}"
  end
  
  def ==(other)
    (face == other.face) && (suit == other.suit)
  end
  
  private
  
    attr_writer :face, :suit
  
end