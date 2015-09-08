# The world map and thing to represent it
# The map is split into 100 continents, each 100x100 squares in size. 
# When you're in-game continents are normally represented in the format Kxx, 
# where the xx is the number of continent e.g. K55. 
class Map
  require 'matrix'
  attr_reader :world_map

  def initialize
    @world_map = Matrix.build(999){}
  end

  def coords_to_s(x, y)
    k = (x / 100) + (y / 100 * 10)
    "C#{k} #{x}|#{y}"
  end

  def parse_to_coords(str_coords)
    # C55 555|558
    x, y = str_coords.split(' ').last.split('|')

    return [x, y]
  end

  def distance_between(coord1, coord2)
    # [x, y] && [x, y]
    Math.hypot(coord1[0] - coord2[0], coord1[1] - coord2[1] )
  end

end
