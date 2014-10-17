require 'towers'
require 'spec_helper'

describe Towers do
  subject(:game){ Towers.new }
  
  it "should have 3 towers" do
    expect(game.towers.length).to eq(3)
  end

  it "should set up initial towers" do
    expect(game.towers[0]).to eq([3, 2, 1])
    expect(game.towers[1]).to be_empty
    expect(game.towers[2]).to be_empty
  end
  
  context 'Moving' do
    it "should take smallest piece and put it elsewhere" do
      game.move(1, 2)
      expect(game.towers[0]).to eq([3, 2])
      expect(game.towers[1]).to eq([1])
      expect(game.towers[2]).to be_empty
    end
    
    it "should return true if move is made successfully" do
      expect(game.move(1, 2)).to eq(true)
    end
    
    it "should not allow you to put a big on a small" do
      game.move(1,2)
      expect { game.move(1,2) }.to raise_error(RuntimeError)
    end
    
    it "should not allow you to take from an empty tower" do
      expect { game.move(2, 3) }.to raise_error
    end
  end
  
  context 'Winning' do
    let(:over_game) do
      g = Towers.new
      g.towers[0] = []
      g.towers[2] = [3, 2, 1]
      g
    end

    it "should win if all disks on other tower" do
      expect(over_game).to be_over
    end
  end
end

describe Game do
  describe "#play" do
    subject(:game){ Game.new }
    
    it "should create an instance of towers" do
      expect(game.towers.class).to eq(Towers) 
    end
    
    it "should make a move" do
      allow(game).to receive(:get_input).and_return([1, 2])
      expect(game.towers).to receive(:move)
      game.play
    end
    
    describe "#get_input" do
      it "should return an array" do
        allow(game).to receive(:gets).and_return("1,2\n")
        expect(game.get_input).to eq([1, 2])
      end
    end
  
    
  end
end