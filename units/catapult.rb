# Represents a catapult
class Catapult < Unit
  WOOD = 320
  CLAY = 400
  IRON = 100
  POPULATION = 8
  ATTACK = 100
  DEF_INF = 100
  DEF_HORSE = 50
  DEF_ARCH = 100
  SPEED = 30
  CARRY = 0
  BUILD_REQ = { workshop: 2, smithy: 12 }

  def building_time_factor
    village.buildings[:workshop].time_factor
  end
end
