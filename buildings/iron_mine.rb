# The IronMine
class IronMine < ResourceBuilding
  BASE_BUILD_TIME = 18
  NEEDS = {
    wood: [
      75, 94, 118, 147, 184, 231, 289, 362, 453, 567, 710, 889, 1113, 1393,
      1744, 2183, 2734, 3422, 4285, 5365, 6717, 8409, 10_528, 13_181, 16_503,
      20_662, 25_869, 32_388, 40_549, 50_768
    ],
    clay: [
      65, 83, 106, 135, 172, 219, 279, 356, 454, 579, 738, 941, 1200, 1529,
      1950, 2486, 3170, 4042, 5153, 6571, 8378, 10_681, 13_619, 17_364, 22_139,
      28_227, 35_990, 45_887, 58_506, 74_595
    ],
    iron: [
      70, 87, 108, 133, 165, 205, 254, 316, 391, 485, 602, 746, 925, 1147,
      1422, 1764, 2187, 2712, 3363, 4170, 5170, 6411, 7950, 9858, 12_224,
      15_158, 18_796, 23_307, 28_900, 35_837
    ],
    pop: [
      10, 2, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8, 10, 11, 13, 15, 18, 21, 25, 28, 34,
      39, 46, 54, 63, 74, 86, 100, 118, 138
    ]
  }
end
