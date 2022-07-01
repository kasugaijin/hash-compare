# frozen_string_literal: true

# compares differences between two hashes at shallow level 0
# compares difference between nested hashes at level 1
class HashCompare

  def initialize(hash1, hash2)
    @hash1 = hash1
    @hash2 = hash2
  end

  # check both arguments on class init are hashes
  def hashes?
    @hash1.instance_of?(Hash) && @hash2.instance_of?(Hash)
  end

  # return true if hashes are equal
  def equal?
    return unless hashes?

    @hash1 == @hash2
  end

  # return array of unique keys
  def unique_keys
    (@hash1.keys + @hash2.keys) - (@hash1.keys & @hash2.keys)
  end

  # return array of shared keys
  def shared_keys
    @hash1.keys & @hash2.keys
  end

  # return array of shared keys with different values at first level of nested hash
  def keys_with_diff_val
    shared_keys.select { |k| @hash1[k] != @hash2[k] }
  end

  # return hash showing different values for a shared key
  def different_values
    values = {}
    keys_with_diff_val.each { |k| values[k] = [@hash1[k], @hash2[k]] }
    values
  end

  # return array of left and right hash values where hash length > 1 i.e. requires deep compare
  def deep_hash_values
    values = []
    different_values.each do |k, v|
      if v[0].instance_of?(Hash) && v[0].keys.count > 1
        values << v
      end
    end
    values
  end

  # deep compare of hashes at second level of a nested hash
  # returns output of unique keys and values for EACH nested hash at second level
  # improve this by finding depth (N) of nested hash and iterating N times
  def deep_hash_unique_values
    deep_hash_values.each do |v|
      deep = HashCompare.new(v[0], v[1])
      puts "Second level unique keys: #{deep.unique_keys}" "\n"
      puts "Second level keys with different values: #{deep.different_values}"
    end
  end

  # shallow compare method to provide outputs for level 0 of nested hash
  def shallow_compare
    return puts 'Hashes are equal' if equal?

    puts "First level unique keys: #{unique_keys}"
    print "First level keys with different values: #{different_values}" "\n"
  end

  # provides output for shallow (level 0) and deep (level 1) hash differences
  def deep_compare
    shallow_compare
    deep_hash_unique_values
  end
end
