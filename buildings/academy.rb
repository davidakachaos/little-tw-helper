# Represents the academy
# Trains snobs!
class Academy < Building
  MAX_LEVEL = 3
  BASE_BUILD_TIME = 1080
  STAFLE = [512, 102, 123]
  BUILD_REQ = { headquaters: 20, smithy: 20, market: 10 }
  NEEDS = {
    wood: [15_000, 30_000, 60_000],
    clay: [25_000, 50_000, 100_000],
    iron: [10_000, 20_000, 40_000],
    pop: [80, 14, 16]
  }

  def initialize
    @setting = :coin
  end

  def world_system=(setting)
    fail 'use :coin or :package' unless [:coin, :package].includes?(setting)
    @setting = setting
  end
end
