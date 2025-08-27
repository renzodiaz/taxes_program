# frozen_string_literal: true

RSpec.describe Models::Product do
  describe '#exempt?' do
    it 'returns true for books' do
      item = Models::Product.new(1, 'book', 12.49)
      expect(item.exempt?).to be true
    end

    it 'returns true for chocolate' do
      item = Models::Product.new(1, 'chocolate bar', 0.85)
      expect(item.exempt?).to be true
    end

    it 'returns true for medical products' do
      item = Models::Product.new(1, 'packet of headache pills', 9.75)
      expect(item.exempt?).to be true
    end

    it 'returns false for music CD' do
      item = Models::Product.new(1, 'music CD', 14.99)
      expect(item.exempt?).to be false
    end

    it 'returns false for perfume' do
      item = Models::Product.new(1, 'bottle of perfume', 18.99)
      expect(item.exempt?).to be false
    end
  end

  describe '#total_price_with_tax' do
    it 'calculates correct price for exempt item' do
      item = Models::Product.new(2, 'book', 12.49)
      expect(item.total_price_with_tax).to eq(24.98)
    end

    it 'calculates correct price for non-exempt item' do
      item = Models::Product.new(1, 'music CD', 14.99)
      expected_tax = (14.99 * 0.10 / 0.05).ceil * 0.05
      expected_total = 14.99 + expected_tax
      expect(item.total_price_with_tax).to eq(expected_total)
    end

    it 'calculates correct price for imported exempt item' do
      item = Models::Product.new(1, 'box of chocolates', 10.00, imported: true)
      expected_tax = (10.00 * 0.05 / 0.05).ceil * 0.05
      expected_total = 10.00 + expected_tax
      expect(item.total_price_with_tax).to eq(expected_total)
    end

    it 'calculates correct price for imported non-exempt item' do
      item = Models::Product.new(1, 'bottle of perfume', 47.50, imported: true)
      expected_tax = (47.50 * 0.15 / 0.05).ceil * 0.05
      expected_total = 47.50 + expected_tax
      expect(item.total_price_with_tax).to eq(expected_total)
    end
  end
end
