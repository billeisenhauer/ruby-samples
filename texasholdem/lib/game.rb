class Game
  
  # def simulate
  #   deck = Deck.new(NUMBER_OF_SHUFFLES)
  #   common_cards = deck.deal(5)
  #   hole = deal_hold_cards(deck)
  #   @hands = []
  #   all_fold = true
  #   while all_fold do
  #     hole.each do |h|
  #       num_common = [0, 3, 4, 5][rand(4)]
  #       if num_common == 5
  #         all_fold = false
  #       end
  #       if num_common > 0
  #         hand = h + common_cards[0...num_common]
  #       else
  #         hand = h
  #       end
  #       hands << hand
  #     end
  #   end
  # end
  # 
  # private
  # 
  #   NUMBER_OF_SHUFFLES = 3
  #   
  #   def deal_hold_cards(deck)
  #     Array.new(NUM_PLAYERS) { deck.deal(2) }
  #   end
  
end

# Game.new.simulate