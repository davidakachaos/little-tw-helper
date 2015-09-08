# Research has three states
# Off, Simple,Avanched
# Off: No Reseach is needed at all,allis given to you
# Simple: can research one level, so yes or no
# Avanced: Can research upto 3 levels
class Research
  BASE_TIMES = {
    spear: 3960,
    sword: 5940,
    axe: 6930,
    archer: 7950,
    scout: 3960,
    light_cavalry: 8910,
    mounted_archer: 9900,
    heavy_cavalry: 9900,
    ram: 7910,
    catapult: 9900
  }
  attr_accessor :max_level # 10, 3 or 1
  attr_accessor :researched

  def initialize
    @researched = BASE_TIMES.keys.dup.collect{|e| [e, 0]}.to_h
  end

  def done?(research)
    @researched[research] >= @max_level
  end

  def research_time(kind, level)
    if @max_level == 10
      # On a ten tech world, each successive research level takes 1.75 times the duration of the previous level.
      BASE_TIMES[kind] * 1.75 ** (level - 1)
    elsif @max_level == 3
      # On a 3 tech world, each successive research level takes 3 times the duration of the previous level.
      BASE_TIMES[kind] * 3 ** (level - 1)
    else
      BASE_TIMES[kind]
    end
  end


end
