# Represents a swordsman
class Swordsman < Unit
  WOOD = 30
  CLAY = 30
  IRON = 70
  POPULATION = 1
  ATTACK = 25
  DEF_INF = 50
  DEF_HORSE = 15
  DEF_ARCH = 40
  SPEED = 22
  CARRY = 15
  BUILD_REQ = { smithy: 1 }

  def building_time_factor
    village.buildings[:barracks].time_factor
  end
end
