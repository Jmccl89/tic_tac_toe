# spec/core_extensions_spec.rb
require 'spec_helper'

describe Array do
  describe '#all_empty?' do
    it 'returns true if all elements of the array are empty' do
      expect(['', '', ''].all_empty?).to be true
    end

    it 'returns false if all elements of the array are not empty' do
      expect(['', 1, '', Object.new, :a].all_empty?).to be false
    end

    it 'returns true for an empty array' do
      expect([].all_empty?).to be true
    end
  end
end
