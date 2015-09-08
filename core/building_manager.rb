# Represents a building queue
class BuildingManager
  attr_reader :village
  attr_reader :time_till_completed
  attr_reader :the_queue

  def initialize(village)
    @village_buildings = village.buildings.dup
    @target = PerfectBuildings.new
    @currently_building = nil
    @state = 'initializing'
    @build_hash = {}
    @the_queue = []
  end

  def target(building)
    @target.send("#{building}")
  end

  def current(building)
    @village_buildings.send("#{building}")
  end

  def needed_level(bld)
    target(bld).level - current(bld).level
  end

  def set_build_hash!
    @build_hash = {}
    Buildings::KINDS.each do |bld|
      next if needed_level(bld) == 0
      @build_hash[bld] = {
        priority: build_priority(bld)
      }
    end
  end

  def build_queue
    set_build_hash!
    next_building = guess_next
    while next_building
      puts "#{next_building} #{current(next_building).level} => #{current(next_building).level + 1}"
      @the_queue << next_building
      # Fake level up
      current(next_building).level += 1
      # Rebuild the hash based on prio
      set_build_hash!
      # Get next building or nil
      next_building = guess_next
    end
  end

  # In this method we try to make sure of a good building order
  # Based on the building we have, wich we need an so on
  def guess_next
    # Always build a rallypoint first, else we can't send troops!
    return :rallypoint if current('rallypoint').level < 1
    return nil if @build_hash.nil? || @build_hash == {}
    to_build = @build_hash.sort_by { |_n, prop| prop[:priority] } .reverse.first[0]
    return to_build if current(to_build).build_requirements?
    # We need to build the requirements first!
    current(to_build)::BUILD_REQ.each do |building, level|
      return building if current(building).level < level
    end
  end

  def real_early_game?
    return true if current('smithy').level == 0
    false
  end

  def rush_to_stable?
    return false if real_early_game?
    if current('stable').level == 0
      puts 'RUSHING TO STABLE!'
      return true
    end
    false
  end

  def production_started_up?
    current('timber_camp').level >= 8 &&
      current('clay_pit').level >= 8 &&
      current('iron_mine').level >= 5
  end

  # priority to build this
  # higher means more prio! this can be overwritten
  def build_priority(bld)
    prio = needed_level(bld)
    return 0 if @level == current(bld).class::MAX_LEVEL # building done
    return 0 if needed_level(bld) == 0
    prio += 2 if current(bld).a_resource?
    # IronMin is slightly less important then Timber and Clay early game
    prio -= 3 if current(bld).class == IronMine && real_early_game?
    return 0 if real_early_game? && current(bld).a_resource? == false && production_started_up? == false
    # Okay, we got production rolling, we need to think about HQ and such
    # We want to get to stables FAST, we need the scouts
    prio = 999 if bld == :stable if rush_to_stable?

    prio
  end
end
