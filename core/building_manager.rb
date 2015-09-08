# Represents a building queue
class BuildingManager
  attr_reader :village
  attr_reader :time_till_completed
  attr_reader :the_queue

  def initialize(village)
    @village = village.dup
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

  def time_display(seconds)
    h = (seconds / 3600).round
    seconds = (seconds % 3600).round
    min = (seconds / 60).round
    seconds = (seconds % 60).round

    "#{h}H #{min}M #{seconds}S"
  end

  def build_queue
    set_build_hash!
    next_building = guess_next
    while next_building
      puts "#{current(next_building)} => #{current(next_building).level + 1}"
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
    # Need to keep room in the farm
    return :farm if @village.percentage_free_population < 10.0
    return :warehouse if @village.percentage_free_storage < 10.0
    return nil if @build_hash.nil? || @build_hash == {}
    # Pick a random building to upgrade next, all have the same priority!
    to_build = get_top(@build_hash.sort_by { |_n, prop| prop[:priority] } .reverse).sample
    return nil if to_build.nil?
    needs = current(to_build).build_requirements(@village)
    return needs if to_build != needs
    return to_build
  end

  def get_top(hash)
    highest = 0
    top_array = []
    hash.each do |name, property|
      break if highest > property[:priority]
      highest = property[:priority]
      top_array << name
    end

    top_array
  end

  def real_early_game?
    return true if current('smithy').level == 0
    false
  end

  def rush_to_stable?
    return false if real_early_game?
    return true if current('stable').level == 0
    false
  end

  def production_started_up?
    current('timber_camp').level >= 10 &&
      current('clay_pit').level >= 10 &&
      current('iron_mine').level >= 7
  end

  def production_almost_max?
    current('timber_camp').level >= 28 &&
      current('clay_pit').level >= 28 &&
      current('iron_mine').level >= 28
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
    prio -= 99 if current(bld).class == Farm || current(bld).class == Warehouse
    return 0 if real_early_game? && current(bld).a_resource? == false && production_started_up? == false
    # Okay, we got production rolling, we need to think about HQ and such
    # We want to get to stables FAST, we need the scouts
    if rush_to_stable?
      if bld == :stable
        prio = 999
      else
        prio = 0
      end
    end
    if production_almost_max?
      if bld == :academy
        prio = 999
      else
        prio = 0
      end
    end

    prio
  end
end
