class Deck

  attr_reader :cards

  def initialize
    @cards = Deck.generate_deck
    shuffle
  end
  
  def self.generate_deck
    cards = []
    
    Card.card_suits.each do |suit|
      Card.card_values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    
    cards
  end
  
  def count
    @cards.count
  end
  
  
  def take(num)
    raise "not enough cards" if num > count
    @cards.shift(num)
  end
  
  def take_back(cards_arr)
    until cards_arr.empty?
      @cards << cards_arr.pop
    end
    cards_arr
  end
  
  def shuffle
    @cards.shuffle
  end
end