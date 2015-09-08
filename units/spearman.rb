# A Spear fighter
class Spearman < Unit
  WOOD = 50
  CLAY = 30
  IRON = 10
  POPULATION = 1
  ATTACK = 10
  DEF_INF = 15
  DEF_HORSE = 45
  DEF_ARCH = 20
  SPEED = 18
  CARRY = 25
  BUILD_REQ = { barracks: 1 }
  BASE_BUILD_TIME = 1020

  def building_time_factor
    village.buildings[:barracks].time_factor
  end
end
