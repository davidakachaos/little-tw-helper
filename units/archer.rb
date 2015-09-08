# Represents an archer
class Archer < Unit
  WOOD = 100
  CLAY = 30
  IRON = 60
  POPULATION = 1
  ATTACK = 15
  DEF_INF = 50
  DEF_HORSE = 40
  DEF_ARCH = 5
  SPEED = 18
  CARRY = 10
  BUILD_REQ = { barracks: 1, headquaters: 1 }

  def building_time_factor
    village.buildings[:barracks].time_factor
  end
end
