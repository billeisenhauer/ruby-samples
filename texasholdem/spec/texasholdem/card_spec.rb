require 'spec_helper'

describe Card do
  
  let(:card) { Card.new('A', 'c') }
  
  context 'creation' do
  
    it 'has a face value' do
      card.face == 'A'
    end
    
    it 'has a suit' do
      card.suit == 'c'
    end
    
  end
  
  context '#==' do
    
    it 'returns true for equal cards' do
      card.should == Card.new('A', 'c')
    end
    
    it 'returns false for unequal cards' do
      card.should_not == Card.new('A', 's')
    end
  
  end
  
  context '#to_s' do
    
    it 'converts to correct string' do
      Card.new('A', 'c').to_s.should == 'Ac'
    end
    
  end
  
end