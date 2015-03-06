require 'spec_helper'

describe Deck do
  
  let(:faces) { %w(3 2 1) }
  let(:suits) { %w(s c) }
  let(:deck_spec) { DeckSpec.new(faces, suits) }
  let(:deck) { DeckFactory.make_deck(deck_spec) }
  
  context "shuffling" do
    
    let(:deck_str) { deck.to_s }
    let(:shuffled_deck_str) { deck.shuffle.to_s }
    
    it 'has different string content (order) as shuffled deck' do
      expect( deck_str ).to_not eq(shuffled_deck_str)
    end
    
    it 'has all cards after shuffle' do
      expect( sorted_deck_str(deck_str) ).to eq(sorted_deck_str(shuffled_deck_str))
    end
    
    it 'has same string length as shuffled deck' do
      expect( deck_str.size ).to eq(shuffled_deck_str.size)
    end
    
    private
    
      def sorted_deck_str(deck_str)
        deck_str.split(' ').sort.join(' ')
      end
    
  end
  
  context "dealing" do
    
    it 'deals 1 card by default' do
      expect( deck.deal ).to eq([ Card.new(faces.first, suits.first) ])
    end
    
  end
  
end