require 'player'
require 'spec_helper'

describe 'player' do
  let(:player) do 
    playa = Player.new("Ben", 1000)
    playa.receive_hand([
    Card.new(:diamonds, :seven),
    Card.new(:diamonds, :three),
    Card.new(:diamonds, :four),
    Card.new(:diamonds, :five),
    Card.new(:diamonds, :six)
    ])
    playa
  end
  
  specify 'a players bet comes out of his/her pot' do
    player.bet(200)
    expect(player.pot).to eq(800)
  end
  
  it 'player can trade in cards' do
    card_old_1 = player.hand[0]
    card_old_2 = player.hand[1]
    player.trade_in([1, 2])
    expect.(player.hand[0]).to_not eq(card_old_1)
    expect.(player.hand[1]).to_not eq(card_old_2)
  end
  
  specify 'a player has a hand' do
    expect(player.hand.count).to eq(5)
  end
  
  
end