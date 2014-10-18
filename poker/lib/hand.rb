require 'debugger'
class Hand
  HIERARCHY = [
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :pair,
    :no_hand
  ]
  
  def initialize(cards)
    take(cards)
  end
  
  def take(cards)
    @cards ||= []
    @cards += cards
  end
  
  def [](card)
    @cards[card]
  end
  
  def count
    @cards.length
  end
  
  def give(cards)
    raise "don't have that many cards" if num > @cards.count
    indices.map do |index|
      @cards.delete(card)
    end
  end
  
  def hand_type
    return :straight_flush if straight_flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :pair if pair?
    :no_hand
  end
  
  def value_hash
    hash = Hash.new([])
    @cards.each do |card|
      hash[card.value] += [card.suit]
    end
    hash
  end
  
  def suit_hash
    hash = Hash.new([])
    @cards.each do |card|
      hash[card.suit] += [card.value]
    end
    hash
  end
  
  def beats?(other_hand)
    return true if higher_hand(other_hand) == -1
    return false if higher_hand(other_hand) == 1
    higher_card(other_hand)
  end
  
  def higher_hand(other_hand)
    self_index = HIERARCHY.rindex(self.hand_type)
    other_index = HIERARCHY.rindex(other_hand.hand_type)
    self_index <=> other_index
  end
  
  def higher_card(other_hand)
    send((hand_type.to_s + '?').to_sym).num_value > other_hand.send((hand_type.to_s + '?').to_sym).num_value
  end
  
  def straight?
    sorted = @cards.sort
    highest = sorted.last
    until sorted.length == 1
      if (sorted.pop.num_value - sorted[-1].num_value != 1)
        return false 
      end
    end
    highest
  end
  
  def flush?
    return suit_hash.keys.max if suit_hash.keys.length == 1
    false
  end
  
  def straight_flush?
    return flush? if flush? && straight?
    false
  end
  
  def pair?
    pairs = value_hash.select { |key, value| value.length == 2 }
    return false if pairs.empty?
    Card::CARD_VALUES[pairs.keys.sort.last]
  end
  
  def two_pair?
    pairs = value_hash.select { |key, value| value.length == 2 } 
    if pairs.keys.length == 2
       return Card::CARD_VALUES[pairs.keys.sort.last]
    end
    false
  end
  
  def three_of_a_kind?
    threes = value_hash.select { |key, value| value.length == 3 }
    return false if threes.empty?
    Card::CARD_VALUES[threes.keys.sort.last]
  end
  
  def four_of_a_kind?
    quads = value_hash.select { |key, value| value.length == 4 }
    return false if quads.empty?
    Card::CARD_VALUES[quads.keys.sort.last]
  end
  
  def full_house?
    return three_of_a_kind? if pair? && three_of_a_kind?
    false
  end
  
  def no_hand?
    @cards.sort.last
  end
end


