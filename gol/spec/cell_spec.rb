require 'cell'

describe Cell do
  let(:dead_subject) { described_class.dead }
  
  it "begins life alive" do
    expect(subject.alive?).to be_true
  end
  
  it "has a list of neighbours" do
    expect(subject.neighbours).to be_empty
  end
  
  it "has a list of living neighbours" do
    expect(subject.living_neighbours).to be_empty
  end

  it "has the ability to evolve" do
    expect { subject.evolve! }.to_not raise_error
  end
  
  
  let(:live_cell) { stub(alive?: true) }
  let(:dead_cell) { stub(alive?: false) }
  
  context "when evolving" do
    before do
      subject.neighbours = neighbours
      subject.evolve!
    end
    
    context "if the cell has 0 neighbours" do
      let(:neighbours) { [] }
      it "dies" do
        expect(subject).to_not be_alive
      end
    end

    context "if the cell has 1 neighbour" do
      let(:neighbours) { [ live_cell ] }
      it "dies" do
        expect(subject).to_not be_alive
      end
    end
  
    context "if the cell has 2 neighbours" do
      context "when the cell is alive" do
        let(:neighbours) { [ live_cell, live_cell ] }
        it "lives" do
          expect(subject).to be_alive
        end
      end
      
      context "when the cell is dead" do
        let(:neighbours) { [ live_cell , live_cell ] }
        
        it "stays dead" do
          expect(dead_subject).to_not be_alive
        end
      end
    end
    
  end
  
end