# Represents a scout
class Scout < Unit
  WOOD = 50
  CLAY = 50
  IRON = 20
  POPULATION = 2
  ATTACK = 0
  DEF_INF = 2
  DEF_HORSE = 1
  DEF_ARCH = 2
  SPEED = 9
  CARRY = 0
  BUILD_REQ = { stable: 1 }

  def building_time_factor
    village.buildings[:stable].time_factor
  end
end