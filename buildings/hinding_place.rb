# This hides the resources when attacked
class HidingPlace < Building
  MAX_LEVEL = 10
  BASE_BUILD_TIME = 30
  STAFLE = [
    5, 1, 1, 2, 1, 2, 3, 3, 3, 5
  ]
  NEEDS = {
    wood: [
      50, 63, 78, 98, 122, 153, 191, 238, 298, 373
    ],
    clay: [
      60, 75, 94, 117, 146, 183, 229, 286, 358, 447
    ],
    iron: [
      50, 63, 78, 98, 122, 153, 191, 238, 298, 373
    ],
    pop: [
      2, 0, 1, 0, 1, 0, 1, 1, 1, 1
    ]
  }
  HIDDEN_RESOURCES = [
    150, 200, 267, 356, 474, 632, 843, 1125, 1500, 2000
  ]

  def hides
    HIDDEN_RESOURCES[@level - 1]
  end
end
