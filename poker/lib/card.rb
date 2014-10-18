# -*- coding: utf-8 -*-

class Card
  SUIT_STRINGS = {
      :clubs    => "♣",
      :diamonds => "♦",
      :hearts   => "♥",
      :spades   => "♠"
    }

    VALUE_STRINGS = {
      :two => "2",
      :three => "3",
      :four  => "4",
      :five  => "5",
      :six   => "6",
      :seven => "7",
      :eight => "8",
      :nine  => "9",
      :ten   => "10",
      :jack  => "J",
      :queen => "Q",
      :king  => "K",
      :ace   => "A"
    }

    CARD_VALUES = {
      :two => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 11,
      :queen => 12,
      :king  => 13,
      :ace => 14
    }
    
    attr_accessor :suit, :value
    
  def initialize(suit, value)
    raise "Suit doesn't exist" unless SUIT_STRINGS.include?(suit)
    raise "Value doesn't exist" unless VALUE_STRINGS.include?(value)
    @suit = suit
    @value = value
  end
  
  def self.card_values
    VALUE_STRINGS.keys
  end
  
  def self.card_suits
    SUIT_STRINGS.keys
  end
  
  def num_value
    CARD_VALUES[self.value]
  end
  
  def to_s
    "#{@value.capitalize} of #{@suit.capitalize}"
  end
  
  def <=>(other_card)
    CARD_VALUES[self.value] <=> CARD_VALUES[other_card.value]
  end
end