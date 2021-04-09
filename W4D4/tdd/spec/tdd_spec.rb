require 'tdd'

describe "#my_uniq" do
    it "should remove duplicate elements from an array" do
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
    it "should handle an empty array" do
        expect { [].my_uniq }.to_not raise_error
    end
end

describe "Array#two_sum" do
    let(:arr) { [-2,2,0,3,1,1,-3] }
    it "should return indices of pairs of elements that sum to zero" do
        expect(arr.two_sum).to contain_exactly([0,1],[3,6])
    end

    it "should return pairs in the correct order" do
        expect(arr.two_sum).to eq([[0,1],[3,6]])
    end
end

describe "my_transpose" do
    let(:twodarr) { [[0,1,2],[3,4,5],[6,7,8]]}
    it "should return a transposed array" do
        expect(my_transpose(twodarr)).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end
end

describe "stock_picker" do
    let(:prices) { [10,1,3,5,2,9] }
    it "should take in an array arr" do
        expect{stock_picker(prices)}.not_to raise_error
    end
    it "should return [i,j] with i < j such that arr[j] - arr[i] is maximized" do
        expect(stock_picker(prices)).to eq([1,5])
    end
end

describe "TowersOfHanoi" do
    let(:game) { TowersOfHanoi.new(4) }
    let(:smaller_game) { TowersOfHanoi.new(2) }

    describe "#initialize" do
        it "should set a size variable" do
            expect(game.size).to eq(4)
        end
        it "should initialize towers" do
        expect(game.towers).to eq([[4,3,2,1],[],[]]) 
        end
    end

    describe "#move" do
        it "should correctly move a piece" do
            game.move(0,1)
            expect(game.towers).to eq([[4,3,2],[1],[]])
        end
    end

    describe "#won?" do
        it "should return false if game is not won" do
            smaller_game.move(0,1)
            expect(smaller_game.won?).to be false        
        end
        it "should return true if game is complete" do
            smaller_game.move(0,1)
            smaller_game.move(0,2)
            smaller_game.move(1,2)
            expect(smaller_game.won?).to be true    
        end
    end
end
