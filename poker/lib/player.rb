class Player
  
  attr_accessor :name, :pot, :hand
  
  def initialize(name, pot)
    @name, @pot = name, pot
  end
  
  def receive_hand(cards)
    @hand = Hand.new(cards)
  end
  
  def bet(amt)
    @pot -= amt
    return amt
  end
  
  def trade_in([1, 2])
end