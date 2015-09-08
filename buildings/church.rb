# Represents a church
class Church < Building
  MAX_LEVEL = 3
  BASE_BUILD_TIME = 340
  STAFLE = [10, 2, 2]
  BUILD_REQ = { headquaters: 5, farm: 5 }
  NEEDS = {
    wood: [
      16_000, 20_160, 25_402
    ],
    clay: [
      20_000, 25_600, 32_768
    ],
    iron: [
      5000, 6300, 7938
    ],
    pop: [
      5000, 2750, 4263
    ]
  }

  def influence_area
    [4, 6, 8][@level - 1]
  end
end
