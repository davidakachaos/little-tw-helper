# Represents a heavy cavalry
class HeavyCavalry < Unit
  WOOD = 200
  CLAY = 150
  IRON = 600
  POPULATION = 6
  ATTACK = 150
  DEF_INF = 200
  DEF_HORSE = 80
  DEF_ARCH = 180
  SPEED = 11
  CARRY = 50
  BUILD_REQ = { stable: 10, smithy: 15 }

  def building_time_factor
    village.buildings[:stable].time_factor
  end
end