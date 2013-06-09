require 'spec_helper'

describe Deck do
  
  let(:faces) { %w(3 2 1) }
  let(:suits) { %w(s c) }
  let(:deck_card_count) { faces.size * suits.size }
  let(:deck) { Deck.new(0, faces, suits) }
  
  context "creation" do
    
    it 'creates a desk with expected number of cards' do
      deck.number_of_cards.should == deck_card_count
    end

    it 'creates an ordered deck' do
      suits.each do |suit|
        faces.each do |face|
          Card.new(face, suit).should == deck.deal.first
        end
      end
    end
    
  end
  
  context "shuffling" do
    
    let(:deck_str) { deck.to_s }
    let(:shuffled_deck_str) { deck.shuffle!.to_s }
    
    it 'has different string content (order) as shuffled deck' do
      deck_str.should_not == shuffled_deck_str
    end
    
    it 'has all cards after shuffle' do
      sorted_deck_str(deck_str).should == sorted_deck_str(shuffled_deck_str)
    end
    
    it 'has same string length as shuffled deck' do
      deck_str.size.should == shuffled_deck_str.size
    end
    
    private
    
      def sorted_deck_str(deck_str)
        deck_str.split(' ').sort.join(' ')
      end
    
  end
  
  context "dealing" do
    
    it 'deals 1 card by default' do
      deck.deal.should == [ Card.new(faces.first, suits.first) ]
    end
    
  end
  
end