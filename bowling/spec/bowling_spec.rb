require 'bowling'

describe Bowling do
  it "scores properly when we're bad at bowling" do
    scores = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    # scores = [0] * 20

    score = subject.score(scores)

    expect(score).to eq(0)
  end

  it "scores properly when we're kinda bad at bowling" do
    scores = [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]
    # scores = [4] * 20

    score = subject.score(scores)

    expect(score).to eq(80)
  end

  it "scores spares properly" do
    pending do
        scores = [5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      [ [5,5],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0] ]

      score = subject.score(scores)

      expect(score).to eq(20)
    end
  end

  describe "#create_frames" do
    it "gives me frames of the rolls" do
      scores = [5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      result = subject.create_frames(scores)
      expected = [ [5,5],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0] ]
      expect(result).to eq(expected)
    end
  end
end

