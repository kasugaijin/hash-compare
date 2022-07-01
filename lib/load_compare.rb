# frozen_string_literal: true

require './hashes'
require './hash_compare'

# runs compare hash_compare class
class LoadCompare
  include Hashes

  def shallow
    run = HashCompare.new(ONE, TWO)
    run.shallow_compare
  end

  def deep
    run = HashCompare.new(ONE, TWO)
    run.deep_compare
  end
end

new = LoadCompare.new
new.deep
# new.shallow
