# respresents a Market
class Market < Building
  MAX_LEVEL = 25
  BASE_BUILD_TIME = 45
  STAFLE = [
    10, 2, 2, 3, 4, 4, 5, 6, 7,
    9, 10, 12, 15, 18, 21, 26,
    31, 37, 44, 53, 64, 77, 92,
    110, 133
  ]
  BUILD_REQ = { headquaters: 3, warehouse: 2 }
  NEEDS = {
    wood: [
      100, 126, 159, 200, 252, 318, 400, 504, 635, 800, 1009, 1271, 1601, 2018,
      2542, 3203, 4036, 5085, 6407, 8073, 10_172, 12_817, 16_149, 20_348, 25_639
    ],
    clay: [
      100, 128, 163, 207, 264, 337, 430, 548, 698, 890, 1135, 1447, 1846, 2353,
      3000, 3825, 4877, 6218, 7928, 10_109, 12_889, 16_433, 20_952, 26_714, 34_060
    ],
    iron: [
      100, 126, 159, 200, 252, 318, 400, 504, 635, 800, 1009, 1271, 1601, 2018, 
      2542, 3203, 4036, 5085, 6407, 8073, 10_172, 12_817, 16_149, 20_348, 25_639
    ],
    pop: [
      20, 3, 4, 5, 5, 7, 7, 9, 10, 12, 14, 16, 20, 22, 26, 31, 36, 42,
      49, 57, 67, 79, 92, 107, 126
    ]
  }

  MERCHANTS_PER_LVL = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 19, 26, 35, 46, 59, 74,
    91, 110, 131, 154, 179, 206, 235
  ]

  def merchants
    MERCHANTS_PER_LVL[@level - 1]
  end

  def max_resources_sendable
    merchants * 1000
  end
end
