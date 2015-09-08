# represents a village, can be owned or not
class Village
  extend Forwardable

  attr_accessor :id
  attr_accessor :x
  attr_accessor :y
  attr_reader :buildings
  attr_reader :research
  attr_reader :units
  attr_reader :loyalty
  attr_reader :build_queue

  def_delegators :@resources, :iron, :clay, :wood
  def_delegators :@buildings, :headquaters, :barracks, :stable, :workshop,
                 :church, :first_church, :academy, :smithy, :rallypoint,
                 :statue, :market, :timber_camp, :clay_pit, :iron_mine,
                 :farm, :warehouse, :hiding_place, :wall
  def_delegators :@units, :spearman, :axeman, :swordsman, :archer, :scout,
                 :light_cavalry, :mounted_archer, :heavy_cavalry, :catapult,
                 :ram, :paladin, :militia, :nobleman

  def initialize(x = nil, y = nil)
    @buildings = Buildings.new
    @resources = Resources.new
    @loyalty = 100
    @units = Units.new
    @research = Research.new
    @build_queue = BuildingManager.new(self)
    @x = x
    @y = y
  end

  def loyalty_raises
    return nil if @loyalty == 100
    @loyalty += 1 * World.speed
  end

  def points
    buildings.values.map(&:points).reduce(:+)
  end

  def max_population
    buildings.farm.max_population
  end

  def free_population
    max_population - buildings.values.map(&:needed_population).reduce(:+)
  end

  def coords
    [x, y]
  end

  def distance(village:)
    Math.hypot(@x - village.x, @y - village.y)
  end

  def has?(resources:, buildings:, units:)
    have_resource = resources.each do |resource, amount|
      send(resource) >= amount
    end

    have_building = buildings.each do |building, level|
      send(building) >= level
    end

    have_units = units.each do |unit, amount|
      send(unit).amount >= amount
    end

    have_resource && have_building && have_units
  end
end
