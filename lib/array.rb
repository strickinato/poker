class Array
  def my_uniq
    new_array = []
    self.each do |item|
      new_array << item unless new_array.include?(item)
    end
    
    new_array
  end
  
  def two_sum
    all_pairs = []
    
    (0...length).each do |i|
      (i+1...length).each do |j|
        all_pairs << [i, j]
      end
    end 
    
    all_pairs.select { |i, j| self[i] + self[j] == 0 }
  end
end