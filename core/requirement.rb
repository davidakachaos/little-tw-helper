# Represents a requirement for something
class Requirement
  attr_reader :wood
  attr_reader :clay
  attr_reader :iron
  attr_reader :pop
  attr_reader :buildings

  # The need of resources, population and buildings
  def initialize(wood, clay, iron, pop, buildings = nil)
    @wood = wood
    @clay = clay
    @iron = iron
    @pop = pop
    @buildings = buildings
  end
end
