require './connect_four.rb'

describe ConnectFour do
  context "#intialize" do
    it "makes the game board and returns the length of 49" do
      c = ConnectFour.new
      expect(c.grid.length).to eq(42 * 2 + 6)
    end
  end
end
