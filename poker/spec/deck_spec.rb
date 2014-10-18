require 'deck'
require 'spec_helper'

describe 'deck' do
  let(:deck) { Deck.new }
  
  it 'should have 52 cards' do
    expect(deck.count).to eq(52)
  end
  
  it 'should deal out cards' do
    taken_cards = deck.take(5)
    expect(deck.count).to eq(47)
    expect(taken_cards.count).to eq(5)
  end
  
  it "should be able to take cards back" do
    taken_cards = deck.take(5)
    deck.take_back(taken_cards)
    expect(deck.count).to eq(52)
    expect(taken_cards.count).to eq(0)
  end
  
end