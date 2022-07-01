# frozen_string_literal: true
require './lib/hash_compare'

describe HashCompare do
  describe "#hashes?" do

    it "returns true if both object classes are Hash" do
      hash_compare = HashCompare.new({ 3 => 1 }, { 3 => 1 })
      expect(hash_compare.hashes?).to be_truthy
    end

    it "returns false if both object classes are not Hash" do
      hash_compare = HashCompare.new(12, { 3 => 1 })
      expect(hash_compare.hashes?).to be_falsy
    end
  end

  describe "#equal?" do

    it "returns true if both hashes are equal" do
      hash_compare = HashCompare.new({ 3 => 1 }, { 3 => 1 })
      expect(hash_compare.equal?).to be_truthy
    end

    it "returns false if both hashes are not equal" do
      hash_compare = HashCompare.new({ 'a' => 1 }, { 3 => 1 })
      expect(hash_compare.equal?).to be_falsy
    end
  end

  describe "#unique_keys" do
    it "returns array of first level keys unique to each hash" do
      hash_compare = HashCompare.new({ 'a' => 1, 'b' => 3 }, { 3 => 1, 'b' => 3 })
      expect(hash_compare.unique_keys).to eq(['a', 3])
    end
  end

  describe "#shared_keys" do
    it "returns array of first level keys shared by each hash" do
      hash_compare = HashCompare.new({ 'a' => 1, 'b' => 3 }, { 3 => 1, 'b' => 3 })
      expect(hash_compare.shared_keys).to eq(['b'])
    end
  end

  describe "#keys_with_diff_val" do
    it "returns array of shared keys with different values" do
      hash_compare = HashCompare.new({ 3 => 9, 'b' => 3 }, { 3 => 1, 'b' => 5 })
      expect(hash_compare.keys_with_diff_val).to eq([3, 'b'])
    end
  end

  describe "#different_values" do
    it "returns hash with shared key as key and array of different values as value" do
      hash_compare = HashCompare.new({ 3 => 9, 'b' => 3 }, { 3 => 1, 'b' => 5 })
      expect(hash_compare.different_values).to eq({ 3 => [9, 1], 'b' => [3, 5] })
    end
  end

  describe "#deep_hash_values" do
    it "returns nested array of different values if both are class Hash with length > 1" do
      hash_compare = HashCompare.new({ 3 => 9, 'b' => { 1 => 2, 3 => 5 } },
                                     { 3 => 9, 'b' => { 1 => 3, 3 => 9 } })
      expect(hash_compare.deep_hash_values).to eq([[{ 1 => 2, 3 => 5 }, { 1 => 3, 3 => 9 }]])
    end

    it "returns empty array if both nested values are not class Hash" do
      hash_compare = HashCompare.new({ 3 => 9, 'b' => [1, 2, 3] },
                                     { 3 => 9, 'b' => { 1 => 3, 3 => 9 } })
      expect(hash_compare.deep_hash_values).to eq([])
    end

    it "returns empty array if both nested values are class hash but with length < 2 " do
      hash_compare = HashCompare.new({ 3 => 9, 'b' => { 1 => 2 } },
                                     { 3 => 9, 'b' => { 1 => 3 } })
      expect(hash_compare.deep_hash_values).to eq([])
    end
  end

  describe "#deep_hash_unique_values" do
    it "prints instance variables to console and returns the original nested array" do
      hash_compare = HashCompare.new({ 3 => 9, 'b' => { 1 => 2, 3 => 5 } },
                                     { 3 => 9, 'b' => { 1 => 3, 3 => 9 } })
      expect(hash_compare.deep_hash_unique_values).to eq([[{ 1 => 2, 3 => 5 }, { 1 => 3, 3 => 9 }]])
    end
  end
end
