require 'debugger'
class Towers
  attr_accessor :towers
  
  def initialize
    @towers = [[3, 2, 1], [], []]
  end
  
  def move(from_input, to_input)
    from = from_input - 1
    to = to_input - 1
    
    assert_good_input(from, to)

    towers[to] << towers[from].pop      
    true
  end
  
  def assert_good_input(from, to)
    raise "cannot take from empty tower" unless towers[from].last
    
    if towers[to].last && towers[from].last > towers[to].last
      raise "cannot put a bigger on a smaller" 
    end
  end
  
  def over?
    @towers[0].empty? && (@towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1])
  end
end

class Game
  attr_accessor :towers
  
  def initialize
    @towers = Towers.new
  end
  
  def play
    input = get_input
    @towers.move(*input)
  end
  
  def get_input
    input = gets.chomp
    input.split(',').map { |i| Integer(i) }
  end

end