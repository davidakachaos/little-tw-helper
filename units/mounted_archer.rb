# represents a mounted archer
class MountedArcher < Unit
  WOOD = 250
  CLAY = 100
  IRON = 150
  POPULATION = 5
  ATTACK = 120
  DEF_INF = 40
  DEF_HORSE = 30
  DEF_ARCH = 50
  SPEED = 10
  CARRY = 50
  BUILD_REQ = { stable: 5 }

  def building_time_factor
    village.buildings[:stable].time_factor
  end
end
