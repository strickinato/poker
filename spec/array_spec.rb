require 'spec_helper'
require 'array'

describe 'array_methods' do
  describe 'remove dups' do
    it 'should remove duplicate items' do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
  end
  
  describe 'two sum' do
    it 'should find all pairs where sum is 0' do
      expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
    end
  end
  
  describe "#stock_picker" do
    it "should return the most profitable days to buy and then sell" do
      expect([5, 4, 3, 2, 6, 1].stock_picker).to eq([3, 4])
    end
  end  
end