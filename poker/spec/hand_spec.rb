require 'hand'
require 'spec_helper'

describe 'hand' do
  subject(:hand) do
     Hand.new(
     Array.new(5) { Card.new(:spades, :ace) }
     )
   end
  
  it 'should have 5 cards' do
    expect(hand.count).to eq(5)
  end
  
  it 'should be able to give and receive cards' do
    given_away = hand.give(2)
    expect(hand.count).to eq(3)
    hand.take(given_away)
    expect(hand.count).to eq(5)
  end
  
  it 'should raise an errors if giving away too many cards' do
    expect { give(6) }.to raise_error
  end
  let(:no_hand) { Hand.new([
    Card.new(:diamonds, :two),
    Card.new(:spades, :five),
    Card.new(:spades, :seven),
    Card.new(:hearts, :king),
    Card.new(:hearts, :four)
  ]) }
  
  let(:no_hand_higher) { Hand.new([
    Card.new(:diamonds, :two),
    Card.new(:spades, :five),
    Card.new(:spades, :seven),
    Card.new(:hearts, :ace),
    Card.new(:hearts, :four)
  ]) }
  
  let(:pair) { Hand.new([
    Card.new(:diamonds, :two),
    Card.new(:spades, :two),
    Card.new(:spades, :seven),
    Card.new(:hearts, :ace),
    Card.new(:hearts, :four)
  ]) }
  
  let(:pair_higher) { Hand.new([
    Card.new(:diamonds, :five),
    Card.new(:spades, :five),
    Card.new(:spades, :seven),
    Card.new(:hearts, :ace),
    Card.new(:hearts, :four)
  ]) }
  
  let(:two_pair) { Hand.new([
    Card.new(:diamonds, :two),
    Card.new(:spades, :two),
    Card.new(:spades, :seven),
    Card.new(:hearts, :seven),
    Card.new(:hearts, :four)
  ]) }
  
  let(:three_of_a_kind) { Hand.new([
    Card.new(:diamonds, :five),
    Card.new(:spades, :five),
    Card.new(:spades, :seven),
    Card.new(:hearts, :ace),
    Card.new(:hearts, :five)
  ]) }
  
  let(:four_of_a_kind) { Hand.new([
    Card.new(:diamonds, :five),
    Card.new(:spades, :five),
    Card.new(:spades, :seven),
    Card.new(:clubs, :five),
    Card.new(:hearts, :five)
  ]) }
  
  let(:straight) { Hand.new([
    Card.new(:diamonds, :two),
    Card.new(:spades, :three),
    Card.new(:spades, :four),
    Card.new(:clubs, :five),
    Card.new(:hearts, :six)
  ]) }
  
  let(:straight_higher) { Hand.new([
    Card.new(:diamonds, :seven),
    Card.new(:spades, :three),
    Card.new(:spades, :four),
    Card.new(:clubs, :five),
    Card.new(:hearts, :six)
  ]) }
  
  let(:flush) { Hand.new([
    Card.new(:diamonds, :nine),
    Card.new(:diamonds, :three),
    Card.new(:diamonds, :four),
    Card.new(:diamonds, :five),
    Card.new(:diamonds, :jack)
  ]) }
  
  let(:straight_flush) { Hand.new([
    Card.new(:diamonds, :seven),
    Card.new(:diamonds, :three),
    Card.new(:diamonds, :four),
    Card.new(:diamonds, :five),
    Card.new(:diamonds, :six)
  ]) }
  
  let(:full_house) { Hand.new([
    Card.new(:spades, :seven),
    Card.new(:diamonds, :seven),
    Card.new(:hearts, :four),
    Card.new(:clubs, :four),
    Card.new(:diamonds, :four)
  ]) }

  
  
  context 'recognizing cards' do
    it "should recognize straights" do
      expect(straight).to be_straight
      expect(full_house).not_to be_straight
    end
    
    it "should recognize flush" do
      expect(flush).to be_flush
      expect(full_house).not_to be_flush
    end
    
    it "should recognize straight-flush" do
      expect(straight_flush).to be_straight_flush
      expect(flush).not_to be_straight_flush
      expect(straight).not_to be_straight_flush
      expect(full_house).not_to be_straight_flush
    end
    
    it "should recognize pairs" do
      expect(pair).to be_pair
      expect(three_of_a_kind).not_to be_pair
      expect(four_of_a_kind).not_to be_pair
      expect(full_house).to be_pair
    end
    
    it "should recognize two pair" do
      expect(two_pair).to be_two_pair
      expect(pair).not_to be_two_pair
      expect(four_of_a_kind).not_to be_two_pair
    end
    
    it "should recognize three of a kind" do
      expect(three_of_a_kind).to be_three_of_a_kind
      expect(pair).not_to be_three_of_a_kind
      expect(four_of_a_kind).not_to be_three_of_a_kind
      expect(full_house).to be_three_of_a_kind
    end
    
    it "should recognize four of a kind" do
      expect(four_of_a_kind).to be_four_of_a_kind
      expect(pair).not_to be_four_of_a_kind
      expect(three_of_a_kind).not_to be_four_of_a_kind
    end
    
    it "should recognize a full house" do
      expect(full_house).to be_full_house
      expect(three_of_a_kind).not_to be_full_house
      expect(two_pair).not_to be_full_house
    end
  
  end
  

  
  
  context 'comparing hands' do
    specify 'no-hand loses to pair' do
      expect(no_hand.beats?(pair)).to eq(false)
      expect(pair.beats?(no_hand)).to eq(true)
    end
  
    specify 'pair loses to three of a kind' do
      expect(pair.beats?(three_of_a_kind)).to eq(false)
      expect(three_of_a_kind.beats?(pair)).to eq(true)
    end
  
    specify 'three of a kind loses to straight' do
      expect(straight.beats?(three_of_a_kind)).to eq(true)
      expect(three_of_a_kind.beats?(straight)).to eq(false)
    end
    
    specify 'straight loses to higher straight' do
      expect(straight_higher.beats?(straight)).to eq(true)
      expect(straight.beats?(straight_higher)).to eq(false)
    end
    
    specify 'high card wins if no hand' do
      expect(no_hand_higher.beats?(no_hand)).to eq(true)
      expect(no_hand.beats?(no_hand_higher)).to eq(false)
    end
    
    specify 'straight loses to flush'
    
    specify 'flush loses to straight flush'
    
    specify 'straight flush loses to full house'
  
    specify 'flush loses to four of a kind'
  
    specify 'four of a kind loses to straight flush' do
      expect(straight_flush.beats?(four_of_a_kind)).to eq(true)
      expect(four_of_a_kind.beats?(straight_flush)).to eq(false)
    end
  
    specify 'any hand loses to any higher hand'
    
  
  end
  
  
end