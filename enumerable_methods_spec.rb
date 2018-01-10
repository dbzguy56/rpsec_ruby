require './enumerable_methods'
=begin
arr = [1, 2, 4, 2]
arr.my_count
arr.my_count(2)
arr.my_count{|x| x % 2 == 0}
=end
describe Enumerable do
  describe "#my_count" do
    arr = [1, 2, 4, 2]
    context "with no parameters" do
      it "Returns the number of elements in the array (4)" do
        expect(arr.my_count).to eq(4)
      end
    end
    context "with one parameter" do
      it "returns the number of times the specified number shows up" do
        expect(arr.my_count(2)).to eq(2)
      end
    end
    context "with a block" do
      it "returns the number of times the block statement is true with the parameter specified" do
        expect(arr.my_count{|x| x % 2 == 0}).to eq(3)
      end
    end
  end
end
