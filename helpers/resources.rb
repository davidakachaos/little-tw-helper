# Is a object of resources
class Resources
  include Comparable
  attr_accessor :iron
  attr_accessor :clay
  attr_accessor :wood
  attr_accessor :population

  def initialize(iron: 0, clay: 0, wood: 0, population: 0)
    @iron = iron
    @clay = clay
    @wood = wood
    @population = population
  end

  def <=>(other)
    @iron <=> other.iron ||
      @clay <=> other.clay ||
      @wood <=> other.wood ||
      @population <=> other.population
  end

  def has?(kind:, amount:)
    case kind
    when :iron
      @iron >= amount
    when :clay
      @clay >= amount
    when :wood
      @wood >= amount
    when :population
      @population >= population
    end
  end
end
