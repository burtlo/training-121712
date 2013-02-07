class Bowling
  def score(rolls)
    # frames = create_frames(rolls)
    rolls.inject(:+)
  end

  def create_frames(original_rolls)
    rolls = original_rolls.dup
    current_frame = []
  
    while !rolls.empty?
      first_roll = rolls.shift
      second_roll = rolls.shift
      current_frame.push [ first_roll, second_roll ]
    end
  
    current_frame
  end

  # def score(rolls)
  #   rolls.inject(0) { |sum,roll| sum + roll }
  # end

  # def score(rolls)
  #   rolls.inject(:+)
  # end

end