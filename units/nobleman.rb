# Represents a nobleman (snob)
class Nobleman < Unit
  WOOD = 40_000
  CLAY = 50_000
  IRON = 50_000
  POPULATION = 100
  ATTACK = 30
  DEF_INF = 100
  DEF_HORSE = 50
  DEF_ARCH = 100
  SPEED = 35
  CARRY = 0
  BUILD_REQ = { academy: 1 }
  
  def building_time_factor
    village.buildings[:academy].time_factor
  end
end
