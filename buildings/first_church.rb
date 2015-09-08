# The First Church
# Build in initial village, larger believe radius
# The First Church can not be destroyed with catapults.
# Is unique for all vilages
class FirstChurch < Building
  MAX_LEVEL = 1
  STAFLE = [10]
  BASE_BUILD_TIME = 15
  BUILD_REQ = {}
  NEEDS = {
    wood: [160],
    clay: [200],
    iron: [50],
    pop: [5]
  }

  def influence_area
    6
  end
end
