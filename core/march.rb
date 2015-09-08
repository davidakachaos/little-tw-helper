# Can be a attack or a support
# Takes kind, source and a target
class March
  def initialize(kind, source, target, units)
    @kind = kind
    @source = source
    @target = target
    # { ram: 200, spearman: 50, scout: 1 }
    @kinds_in_march = []
    units.each{|k, amount|
      @kinds_in_march << k.classify
    }
    @units = units
  end

  def speed
    units.collect
  end
end
