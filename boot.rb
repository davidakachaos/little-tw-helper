# Open the String class to add some methods
class String
  def classify
    Object.const_get(titleize)
  end

  def titleize
    split('_').map(&:capitalize).join
  end
end

# Open the symbol class to add some methods
class Symbol
  def classify
    to_s.classify
  end
end

require 'forwardable'
require 'yaml'
root = File.dirname(File.absolute_path(__FILE__))
# Loading classes
Dir.glob(root + '/core/*', &method(:require))
Dir.glob(root + '/helpers/*', &method(:require))
Dir.glob(root + '/buildings/*', &method(:require))
Dir.glob(root + '/units/*', &method(:require))
