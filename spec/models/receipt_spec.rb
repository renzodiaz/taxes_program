RSpec.describe Models::Receipt do
  let(:receipt) { Models::Receipt.new }

  describe '#add_item' do
    it 'adds product to receipt' do
      item = Models::Product.new(1, 'book', 12.49)
      receipt.add_item(item)
      expect(receipt.items.size).to eq(1)
    end
  end

  describe '#total_sales_tax' do
    it 'calculates total tax for multiple items' do
      item1 = Models::Product.new(2, 'book', 12.49)
      item2 = Models::Product.new(1, 'music CD', 14.99)

      receipt.add_item(item1)
      receipt.add_item(item2)

      expected_tax = item1.total_tax + item2.total_tax
      expect(receipt.total_sales_tax).to eq(expected_tax)
    end
  end

  describe '#generate' do
    it 'generates correct receipt format' do
      item1 = Models::Product.new(1, 'book', 12.49)
      item2 = Models::Product.new(1, 'music CD', 14.99)

      receipt.add_item(item1)
      receipt.add_item(item2)

      output = receipt.generate
      lines = output.split("\n")

      expect(lines[0]).to match(/^1 book: \d+\.\d{2}$/)
      expect(lines[1]).to match(/^1 music CD: \d+\.\d{2}$/)
      expect(lines[2]).to match(/^Sales Taxes: \d+\.\d{2}$/)
      expect(lines[3]).to match(/^Total: \d+\.\d{2}$/)
    end
  end
end
