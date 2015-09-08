# Represents the militia in the farm
class Militia < Unit
  WOOD = 0
  CLAY = 0
  IRON = 0
  POPULATION = 0
  ATTACK = 5
  DEF_INF = 15
  DEF_HORSE = 45
  DEF_ARCH = 25
  SPEED = 0
  CARRY = 0
  BUILD_REQ = { farm: 1 }

  def building_time_factor
    village.buildings[:farm].time_factor
  end
end
