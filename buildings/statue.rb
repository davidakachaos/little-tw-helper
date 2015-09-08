# represents the statue for a knight
class Statue < Building
  MAX_LEVEL = 1
  BASE_BUILD_TIME = 25
  STAFLE = [24]
  NEEDS = {
    wood: [220],
    clay: [220],
    iron: [220],
    pop: [10]
  }
end
