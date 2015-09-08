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

  def to_s
    "#{self.class} level: #{self.level}"
  end

  def creation_time
    return nil if self.level == self.class::MAX_LEVEL || self.class::MAX_LEVEL.nil?
    self.class::BASE_BUILD_TIME * 1.2**(self.level) # - 1 No, we need next level
  end

  def build_time(village)
    village = village || @village
    # actual build time =
    # [duration of creation]*1.05^(-[level of the village headquarters])
    level_hq = village.buildings.headquaters.level || 20
    creation_time * 1.05**(-level_hq)
  end

  def build_requirements(village)
    has = true
    village = village || @village
    self.class::BUILD_REQ.each do |building, level|
      has = village.buildings.send(building.to_sym).level >= level
      return building.to_sym if has == false
    end
    puts "I (#{self.class}) do#{has ? nil : "n't"} have the requested buildings!" unless has
    if village.free_population <= self.needs.population
      puts "I (#{self.class}) need a bigger farm!"
      return :farm
    end
    # Now we will check if we have enough space to store the needed resources
    if village.max_storage < self.needs.iron || village.max_storage < self.needs.wood || village.max_storage < self.needs.clay
      puts "I (#{self.class}) need a bigger warehouse!"
      return :warehouse
    end

    return self.class.to_s.underscore.to_sym
  end

  def points
    return 0 if self.level == 0
    self.class::STAFLE.first(self.level).reduce(:+)
  end

  def needed_population
    return 0 if self.level == 0 || self.level.nil?
    self.class::NEEDS[:pop].first(self.level).reduce(:+)
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
    self.level <=> other.level
  end

  def needs
    res = Resources.new
    res.iron = self.class::NEEDS[:iron][self.level]
    res.clay = self.class::NEEDS[:clay][self.level]
    res.wood = self.class::NEEDS[:wood][self.level]
    if self.class::NEEDS.keys.include?(:pop)
      res.population = self.class::NEEDS[:pop][self.level]
    else
      res.population = 0
    end

    res
  end

  def pop_needed
    return 0 unless self.class::NEEDS.keys.include?(:pop)
    self.class::NEEDS[:pop][self.level]
  end

  def wood_needed
    self.class::NEEDS[:wood][self.level]
  end

  def clay_needed
    self.class::NEEDS[:clay][self.level]
  end

  def iron_needed
    self.class::NEEDS[:iron][self.level]
  end
end
