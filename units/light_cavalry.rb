# Respresents a Light Cavalry
class LightCavalry < Unit
  WOOD = 125
  CLAY = 100
  IRON = 250
  POPULATION = 4
  ATTACK = 130
  DEF_INF = 30
  DEF_HORSE = 40
  DEF_ARCH = 30
  SPEED = 10
  CARRY = 80
  BUILD_REQ = { stable: 3 }

  def building_time_factor
    village.buildings[:stable].time_factor
  end
end
