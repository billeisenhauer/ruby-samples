require 'lib/card'
require 'lib/deck'
require 'lib/hand'

class Simulator
  
  FACES = %w(A K Q J 10 9 8 7 6 5 4 3 2 1)
  SUITS = %w(s h c d)
  
  # def simulate
  #   deck = Deck.new(NUMBER_OF_SHUFFLES)
  #   common_cards = deck.deal(NUM_CARDS_IN_COMMON)
  #   player_hole_cards = deal_hold_cards(deck)
  #   hands = []
  #   all_fold = true
  #   while all_fold do
  #     player_hole_cards.each do |hole_cards|
  #       num_common_cards_in_common = randomly_determine_number_of_cards_in_common
  #       all_fold = false if num_common_cards_in_common == NUM_CARDS_IN_COMMON
  #       hands << create_hand(hole_cards, common_cards, num_common_cards_in_common)
  #     end
  #   end
  #   hands.each { |hand| puts hand }
  # end
  # 
  # private
  # 
  #   NUMBER_OF_SHUFFLES = 3
  #   NUM_PLAYERS = 8
  #   NUM_CARDS_IN_COMMON = 5
  #   NUM_CARDS_IN_HOLE = 2
  #   
  #   def deal_hold_cards(deck)
  #     Array.new(NUM_PLAYERS) { deck.deal(NUM_CARDS_IN_HOLE) }
  #   end
  #   
  #   def create_hand(hole_cards, common_cards, num_common_cards_in_common)
  #     hand = Hand.new
  #     hand.take(hole_cards)
  #     if num_common_cards_in_common > 0
  #       common_cards[0...num_common_cards_in_common].each do |card| 
  #         hand.take(card)
  #       end
  #     end
  #     hand
  #   end
  #   
  #   def randomly_determine_number_of_cards_in_common
  #     [0, 3, 4, 5][rand(4)]
  #   end
  
end

Simulator.new.simulate