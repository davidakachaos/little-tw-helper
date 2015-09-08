# Represents a group of buildings that make up a village
class Buildings
  KINDS = [
    :headquaters, :barracks, :stable, :workshop, :church, :first_church,
    :academy, :smithy, :rallypoint, :statue, :market, :timber_camp, :clay_pit,
    :iron_mine, :farm, :warehouse, :hiding_place, :wall
  ]

  attr_accessor(
    :headquaters, :barracks, :stable, :workshop, :church, :first_church,
    :academy, :smithy, :rallypoint, :statue, :market, :timber_camp, :clay_pit,
    :iron_mine, :farm, :warehouse, :hiding_place, :wall
  )

  def initialize
    KINDS.each do |kind|
      send("#{kind}=", kind.classify.new)
    end
  end

  def keys
    KINDS
  end

  def values
    vals = []
    KINDS.each do |kind|
      vals << send("#{kind}")
    end

    vals
  end
end
