# Respresents a rallypoint
class Rallypoint < Building
  BASE_BUILD_TIME = 20
  MAX_LEVEL = 1
  STAFLE = [0]
  NEEDS = {
    wood: [10],
    clay: [40],
    iron: [30],
    pop: [0]
  }

  def initialize
    super
    @level = 1
  end
end
