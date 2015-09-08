# Represents a ram
class Ram < Unit
  WOOD = 300
  CLAY = 200
  IRON = 200
  POPULATION = 5
  ATTACK = 2
  DEF_INF = 20
  DEF_HORSE = 50
  DEF_ARCH = 20
  SPEED = 30
  CARRY = 0
  BUILD_REQ = { workshop: 1 }
  
  def building_time_factor
    village.buildings[:workshop].time_factor
  end
end