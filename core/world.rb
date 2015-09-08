# Contains the world settings
class World
  def initialize
    # Needs to get the world settings and store them!
    # http://en34.tribalwars.net/interface.php?func=get_building_info
    # http://en34.tribalwars.net/interface.php?func=get_unit_info
  end

  def self.can_destroy?
    true
  end

  def self.build_time_factor
    1.2
  end

  def self.unit_speed
    1.0
  end

  def self.speed
    @speed ||= 1.0
  end
end
