class Cell
  def self.dead
    cell = new()
    cell.alive = false
    cell
  end

  def initialize
    @alive = true
  end

  attr_accessor :alive
  alias_method :alive?, :alive

  def neighbours
    @neighbours ||= []
  end

  attr_writer :neighbours

  def living_neighbours
    neighbours.find_all { |neighbour| neighbour.alive? }
  end

  def evolve!
    rule = rules.find { |rule| rule.apply?(self) }
    rule.apply(self)
  end

  def rules
    [ RuleOfLoneliness.new, NoOperationRule.new ]
  end

end

class NoOperationRule
  def apply?(cell)
    true
  end
  def apply(cell)
    cell
  end
end

class RuleOfLoneliness
  def apply?(cell)
    cell.alive? and cell.living_neighbours.count < 2
  end

  def apply(cell)
    Cell.dead
  end
end