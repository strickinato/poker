require 'card'
require 'spec_helper'

describe 'card' do
  let(:card) { Card.new(:diamonds, :three) }
  let(:card2) { Card.new(:diamonds, :four) }
  
  it 'should have a value' do
    expect(card.value).to eq(:three)
  end
  
  it 'should have a suit' do
    expect(card.suit).to eq(:diamonds)
  end
  
  it 'should be able to be printed' do
    expect(card.to_s).to eq("Three of Diamonds")
  end
  
  specify 'cards should use spaceship operator' do
    expect(card <=> card2).to eq(-1)
    expect(card2 <=> card).to eq(1)
  end
  
end