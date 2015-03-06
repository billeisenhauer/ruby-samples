class Game
  
  def initialize
    @hands = deal_and_play_hands
  end
  
  def rank
    # TODO
  end
  
  def to_s
    @hands.each(&:to_s)
  end
  
  private
  
    NUM_PLAYERS = 6
    NUMBER_OF_SHUFFLES = 3
    FACES = %w(A K Q J 10 9 8 7 6 5 4 3 2 1)
    SUITS = %w(s h c d)
    
    def deal_and_play_hands
      deck = prepare_deck
      hole_hands = deal_hole_hands(deck)
      deal_community_cards(deck, hole_hands)
    end
    
    def prepare_deck
      spec = DeckSpec.new(FACES, SUITS)
      deck = DeckFactory.make_deck(spec)
      shuffle(deck)
    end
    
    def shuffle(deck, times_remaining=NUMBER_OF_SHUFFLES)
      return deck unless times_remaining > 0
      shuffle(deck.shuffle, times_remaining-1)
    end
    
    def deal_hole_hands(deck)
      Array.new(NUM_PLAYERS) { Hand.new(deck.deal(2)) }
    end
    
    def deal_community_cards(deck, hole_hands)
      community_cards = deck.deal(5)
      all_fold = true
      while all_fold do
        hole_hands.each do |hole_hand|
          num_common = randomly_determine_number_of_cards_in_common
          all_fold = false if num_common == 5
          next unless num_common > 0
          community_cards[0...num_common].each do |card|              
            hole_hand.take(card)
          end
        end
      end
      hole_hands
    end
    
    def randomly_determine_number_of_cards_in_common
      [0, 3, 4, 5][rand(4)]
    end
  
end