require 'board'

describe Board do
  describe "#cells" do
    
    it "gives me a list of living cells" do
      expect(subject.cells).to be_empty
    end
  end
  
  describe "#tick" do
    it "moves the time forward one step" do
      expect { subject.tick }.to_not raise_error
    end
  end
  
end