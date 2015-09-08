# Produces a resource, shares everthing but the kind of resouce
class ResourceBuilding < Building
  MAX_LEVEL = 30
  STAFLE = [
    6, 1, 2, 1, 2, 3, 3, 3, 5, 5, 6, 8,
    8, 11, 13, 15, 19, 22, 27, 32, 28, 46,
    55, 66, 80, 95, 115, 137, 165, 198
  ]

  PROD_HOUR = [
    30, 35, 41, 47, 55, 64, 74, 86, 100,
    117, 136, 158, 184, 214, 249, 289, 337,
    391, 455, 530, 616, 717, 833, 969,
    1127, 1311, 1525, 1774, 2063, 2400
  ]

  def a_resource?
    true
  end

  def produces
    PROD_HOUR[@level - 1]
  end

  def per_minute
    produces / 60.0
  end
end
