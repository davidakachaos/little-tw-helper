# Represents a unit, to be specified later
class Unit
  attr_accessor :village
  attr_accessor :amount

  WOOD = 0
  CLAY = 0
  IRON = 0
  POPULATION = 1
  ATTACK = 0 # The attack strength shows how strong the unit is during an attack.
  DEF_INF = 0 # The defensive strength shows how well a unit can defend itself against infantry units.
  DEF_HORSE = 0 # The cavalry defense shows how well a unit can defend itself against cavalry units
  DEF_ARCH = 0 # The archer defense gives the defensive strength of a unit when defending against archers and mounted archers
  SPEED = 0 # Speed: The speed tells you how many minutes this unit needs to cross one field.
  CARRY = 0 # The haul tells you how much this unit can carry.
  BUILD_REQ = {}

  def initialize(amount: 0)
    @amount = amount
  end

  def build_requirements?
    has = true
    BUILD_REQ.each do |building, level|
      has = @vilage.buildings[building] >= level
      break if has == false
    end

    has
  end

  def to_s
    "#{self.class} amount: #{@amount}"
  end

  def attack_strength
    self.class::ATTACK * @amount
  end

  def carries
    self.class::CARRY * @amount
  end

  def defence_infantry
    self.class::DEF_INF * @amount
  end

  def defence_horses
    self.class::DEF_HORSE * @amount
  end

  def defence_archers
    self.class::DEF_ARCH * @amount
  end

  # Returns the level of the building who builds the unit
  def building_time_factor
    fail 'Overwrite the building_time_factor method!'
  end

  def build_time
    2.0 / 3.0 * self.class::BASE_BUILD_TIME * building_time_factor
  end
end
