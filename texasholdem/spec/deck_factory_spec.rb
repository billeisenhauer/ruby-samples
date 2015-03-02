require 'spec_helper'

describe DeckFactory do
  
  let(:faces) { %w(A K Q J 10 9 8 7 6 5 4 3 2 1) }
  let(:suits) { %w(s h c d) }
  let(:deck_spec) { DeckSpec.new(faces, suits) }
  
  it 'builds a deck with a card per face and suit' do
    deck = DeckFactory.make_deck(deck_spec)
    expect( deck.number_of_cards ).to eql(deck_spec.number_of_cards)
  end
  
  it 'build a deck in order of suits by faces' do
    deck = DeckFactory.make_deck(deck_spec)
    deck_spec.suits.each do |suit|
      deck_spec.faces.each do |face|
        expect( deck.deal ).to eq([Card.new(face, suit)])
      end
    end
  end
  
end