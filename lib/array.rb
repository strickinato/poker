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

  def stock_picker
    best_pair = []
    best_value = 0
    (0...self.length).each do |buy| 
      (buy + 1...self.length).each do |sell|
        best_pair = [buy, sell] if self[sell] - self[buy] > best_value
      end
    end
  
    best_pair
  end
  
end

