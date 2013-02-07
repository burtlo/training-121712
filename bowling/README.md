# Bowling Kata

You will learn to punch bowling balls.

## Setup

* Create `lib` and `spec` directories
* Create `lib/bowling.rb` and `spec/bowling_spec.rb`

## First Specification

```ruby
require 'bowling'

describe Bowling do
  it "scores properly when we're bad at bowling" do
    scores = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    score = Bowling.new.score(scores)

    expect(score).to eq(0)
  end

  it "scores properly when we're kinda bad at bowling" do
    scores = [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4 4 4]

    score = Bowling.new.score(scores)

    expect(score).to eq(80)
  end

  it "scores spares properly" do
    scores = [5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    score = Bowling.new.score(scores)

    expect(score).to eq(20)
  end
  it "scores strikes properly" do
    scores = [10,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    score = Bowling.new.score(scores)

    expect(score).to eq(26)
  end

  it "scores strikes and spares properly" do
    scores = [10,5,5,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    score = Bowling.new.score(scores)

    expect(score).to eq(34)
  end
end
```
