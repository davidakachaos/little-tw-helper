# Represents a Axeman
class Axeman < Unit
  WOOD = 60
  CLAY = 30
  IRON = 70
  POPULATION = 1
  ATTACK = 40
  DEF_INF = 10
  DEF_HORSE = 5
  DEF_ARCH = 10
  SPEED = 18
  CARRY = 10
  BUILD_REQ = { smithy: 2 }

  def building_time_factor
    village.buildings[:barracks].time_factor
  end
end
