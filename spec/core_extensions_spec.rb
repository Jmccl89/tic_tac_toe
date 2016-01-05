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

  describe '#all_same?' do
    it 'returns true if all elements of the Array are the same' do
      expect(['A', 'A', 'A'].all_same?).to be true
    end

    it 'returns false if some of the elements of the Array are different' do
      expect(['A', 'B', 'C'].all_same?).to be false
    end

    it 'returns true for an empty Array' do
      expect([].all_same?).to be true
    end
  end

  describe '#any_empty?' do
    it 'returns true if any element is empty' do
      expect(['1', '2', ''].any_empty?).to be true
    end

    it 'returns false when no element is empty' do
      expect(['1', '2', '3'].any_empty?).to be false
    end

    it 'returns false for an empty array' do
      expect([].any_empty?).to be false
    end
  end

  describe '#none_empty?' do
    it 'returns false if no element is empty' do
      expect(['1', '2', '3'].any_empty?).to be false
      
    end

    it 'returns true if any element is empty' do
      expect(['1', '2', ''].any_empty?).to be true
    end

    it 'returns false for an empty array' do
      expect([].any_empty?).to be false
    end
  end
end
