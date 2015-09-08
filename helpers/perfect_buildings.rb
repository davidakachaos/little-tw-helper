# represents the target buildings for dev
class PerfectBuildings < Buildings
  def initialize
    super
    headquaters.level = 20
    barracks.level = 25
    stable.level = 20
    workshop.level = 10
    academy.level = 1
    smithy.level = 20
    rallypoint.level = 1
    market.level = 11
    timber_camp.level = 30
    clay_pit.level = 30
    iron_mine.level = 30
    farm.level = 30
    warehouse.level = 30
    hiding_place.level = 0
    wall.level = 20
  end
end
