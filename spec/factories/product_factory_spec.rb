# frozen_string_literal: true

RSpec.describe Factories::ProductFactory do
  describe '.create_from_input' do
    it 'creates item from simple input' do
      item = Factories::ProductFactory.create_from_input('2 book at 12.49')
      expect(item.quantity).to eq(2)
      expect(item.name).to eq('book')
      expect(item.price).to eq(12.49)
      expect(item.imported?).to be false
    end

    it 'creates imported item from input' do
      item = Factories::ProductFactory.create_from_input('1 imported bottle of perfume at 47.50')
      expect(item.quantity).to eq(1)
      expect(item.name).to eq('bottle of perfume')
      expect(item.price).to eq(47.50)
      expect(item.imported?).to be true
    end

    it 'creates item with multiple words in name' do
      item = Factories::ProductFactory.create_from_input('1 packet of headache pills at 9.75')
      expect(item.quantity).to eq(1)
      expect(item.name).to eq('packet of headache pills')
      expect(item.price).to eq(9.75)
      expect(item.imported?).to be false
    end
  end
end
