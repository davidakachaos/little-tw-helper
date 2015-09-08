# Represents a building queue
class BuildingManager
  attr_reader :village
  attr_reader :time_till_completed
  attr_reader :the_queue

  def initialize(village)
    @village = village
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
    if @currently_building.nil?
      # Always build a rallypoint first, else we can't send troops!
      return :rallypoint if current('rallypoint').level < 1
      return nil if @build_hash.nil? || @build_hash == {}
      to_build = @build_hash.sort_by { |_n, prop| prop[:priority] } .reverse.first[0]
      return nil if to_build.nil?
      # puts "Based on prio: #{to_build} => F:#{current(to_build).level } T:#{current(to_build).level + 1} :: #{current(to_build).class::BUILD_REQ if current(to_build).level < 1 }"
      return to_build if current(to_build).build_requirements?(@village)
      # We need to build the requirements first!
      @currently_building = to_build
      current(to_build).class::BUILD_REQ.each do |building, level|
        if current(building).level < level
          # puts " To build a #{to_build} we need to build a #{building} of level #{level}, we have a level #{current(building).level}"
          return building
        end
      end
      # puts "We're done! All buildings have finished!"
      return nil
    else
      # We are building prerequests for a building!
      current(@currently_building).class::BUILD_REQ.each do |building, level|
        if current(building).level < level
          # puts " To build a #{@currently_building} we need to build a #{building} of level #{level}, we have a level #{current(building).level}"
          return building
        end
      end
      to_build = @currently_building
      @currently_building = nil
      # puts "Based on prio: #{to_build} => F:#{current(to_build).level } T:#{current(to_build).level + 1} :: #{current(to_build).class::BUILD_REQ if current(to_build).level < 1 }"
      return to_build
    end
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
    current('timber_camp').level >= 8 &&
      current('clay_pit').level >= 8 &&
      current('iron_mine').level >= 5
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
