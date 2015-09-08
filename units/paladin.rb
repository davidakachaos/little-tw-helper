# Represents the paladin
# Is unique for a player!
class Paladin < Unit
  WOOD = 20
  CLAY = 20
  IRON = 40
  POPULATION = 10
  ATTACK = 150
  DEF_INF = 250
  DEF_HORSE = 400
  DEF_ARCH = 150
  SPEED = 10
  CARRY = 100
  BUILD_REQ = { statue: 1 }

  def building_time_factor
    village.buildings[:statue].time_factor
  end
end
