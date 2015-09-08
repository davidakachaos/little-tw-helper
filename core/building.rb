# common building
class Building
  include Comparable
  attr_accessor :village

  BASE_BUILD_TIME = 0.0 # in seconds!
  MAX_LEVEL = 0
  MIN_LEVEL = 0
  STAFLE = []
  BUILD_REQ = {}
  NEEDS = {
    wood: [],
    clay: [],
    iron: [],
    pop: []
  }

  def initialize(ilevel = nil)
    @level = ilevel || self.class::MIN_LEVEL
  end

  def a_resource?
    false
  end

  def creation_time
    return nil if @level == self.class::MAX_LEVEL
    self.class::BASE_BUILD_TIME * 1.2**(@level) # - 1 No, we need next level
  end

  def build_time
    # actual build time =
    # [duration of creation]*1.05^(-[level of the village headquarters])
    level_hq = village.buildings[:headquaters].level
    creation_time * 1.05**(-level_hq)
  end

  def build_requirements?
    has = true
    BUILD_REQ.each do |building, level|
      has = @vilage.buildings[building] >= level
      break if has == false
    end

    has
  end

  def points
    return 0 if @level == 0
    self.class::STAFLE.first(@level).reduce(:+)
  end

  def level
    @level || 0
  end

  def level=(ilevel)
    fail 'More then the max level' if ilevel > self.class::MAX_LEVEL
    fail 'Less then the min level' if ilevel < self.class::MIN_LEVEL
    @level = ilevel
  end

  def <=>(other)
    fail 'Must compare same type' if other.class != self.class
    @level <=> other.level
  end

  def needs
    res = Resources.new
    res.iron = self.class::NEEDS[:iron][@level]
    res.clay = self.class::NEEDS[:clay][@level]
    res.wood = self.class::NEEDS[:wood][@level]
    res.population = self.class::NEEDS[:pop][@level]

    res
  end

  def pop_needed
    self.class::NEEDS[:pop][@level]
  end

  def wood_needed
    self.class::NEEDS[:wood][@level]
  end

  def clay_needed
    self.class::NEEDS[:clay][@level]
  end

  def iron_needed
    self.class::NEEDS[:iron][@level]
  end
end
