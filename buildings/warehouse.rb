# The Warehouse
# Stores resources
class Warehouse < Building
  MIN_LEVEL = 1
  BASE_BUILD_TIME = 17
  MAX_LEVEL = 30
  STAFLE = [
    6, 1, 2, 1, 2, 3, 3, 3, 5, 5, 6, 8,
    8, 11, 13, 15, 19, 22, 27, 32, 28, 46,
    55, 66, 80, 95, 115, 137, 165, 198
  ]
  NEEDS = {
    wood: [
      60, 76, 96, 121, 154, 194, 246, 311, 393, 498, 630, 796, 1007, 1274,
      1612, 2039, 2580, 3264, 4128, 5222, 6606, 8357, 10_572, 13_373, 16_917,
      21_400, 27_071, 34_245, 43_320, 54_799
    ],
    clay: [
      50, 64, 81, 102, 130, 165, 210, 266, 338, 430, 546, 693, 880, 1118,
      1420, 1803, 2290, 2908, 3693, 4691, 5957, 7566, 9608, 12_203, 15_497,
      19_682, 24_996, 31_745, 40_316, 51_201
    ],
    iron: [
      40, 50, 62, 77, 96, 120, 149, 185, 231, 287, 358, 446, 555, 691, 860,
      1071, 1333, 1659, 2066, 2572, 3202, 3987, 4963, 6180, 7694, 9578,
      11_925, 14_847, 18_484, 23_013
    ]
  }

  CAPASITY_PER_LEVEL = [
    1000, 1229, 1512, 1859, 2285, 2841, 3454, 4247, 5222, 6420, 7893, 9705,
    11_932, 14_670, 18_037, 22_177, 27_266, 33_523, 41_217, 50_675, 62_305,
    76_604, 94_184, 115_798, 142_373, 175_047, 215_219, 264_611, 325_337, 400_000
  ]

  def needed_population
    0
  end

  def capasity
    CAPASITY_PER_LEVEL[@level - 1]
  end
end
