# A player has vilages
# A players points == points of all vilages
class Player
  attr_accessor :vilages
  def initialize(name)
    @name = name
  end

  def vilages=(vilages)
    fail 'Not an Array!' if vilages.class != Array
    fail 'Must be a array of Villages!' if vilages.any? { |e| e.class != Village }
    @vilages = vilages
  end

  def points
    @vilages.map(&:points).reduce(:+)
  end
end
