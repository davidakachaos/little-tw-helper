# is a group of units
class Units
  KINDS = [
    :spearman, :axeman, :swordsman, :archer,
    :scout, :light_cavalry, :mounted_archer, :heavy_cavalry,
    :catapult, :ram, :paladin, :militia, :nobleman
  ]

  attr_accessor(
    :spearman, :axeman, :swordsman, :archer,
    :scout, :light_cavalry, :mounted_archer, :heavy_cavalry,
    :catapult, :ram, :paladin, :militia, :nobleman
  )

  def initialize
    KINDS.each do |kind|
      send("#{kind}=", kind.classify.new)
    end
  end

  def keys
    KINDS
  end

  def values
    vals = []
    KINDS.each do |kind|
      vals << send("#{kind}")
    end

    vals
  end

  # Define some methods to count the total of these
  [
    :attack_strength, :carries, :defence_infantry,
    :defence_horses, :defence_archers, :amount
  ].each do |mth|
    define_method(mth) do
      values.map(&mth).reduce(:+)
    end
  end
end
