# frozen_string_literal: true

RSpec.describe Services::TaxCalculator do
  describe 'test cases with provided examples' do
    it 'handles Input 1 correctly' do
      calculator = Services::TaxCalculator.new
      input = [
        '2 book at 12.49',
        '1 music CD at 14.99',
        '1 chocolate bar at 0.85'
      ]

      calculator.process_input(input)
      receipt = calculator.generate_receipt

      expect(receipt).to include('2 book: 24.98')
      expect(receipt).to include('1 music CD: 16.49')
      expect(receipt).to include('1 chocolate bar: 0.85')
      expect(receipt).to include('Sales Taxes: 1.50')
      expect(receipt).to include('Total: 42.32')
    end

    it 'handles Input 2 correctly' do
      calculator = Services::TaxCalculator.new
      input = [
        '1 imported box of chocolates at 10.00',
        '1 imported bottle of perfume at 47.50'
      ]

      calculator.process_input(input)
      receipt = calculator.generate_receipt

      expect(receipt).to include('1 imported box of chocolates: 10.50')
      expect(receipt).to include('1 imported bottle of perfume: 54.65')
      expect(receipt).to include('Sales Taxes: 7.65')
      expect(receipt).to include('Total: 65.15')
    end

    it 'handles Input 3 correctly' do
      calculator = Services::TaxCalculator.new
      input = [
        '1 imported bottle of perfume at 27.99',
        '1 bottle of perfume at 18.99',
        '1 packet of headache pills at 9.75',
        '3 imported boxes of chocolates at 11.25'
      ]

      calculator.process_input(input)
      receipt = calculator.generate_receipt

      expect(receipt).to include('1 imported bottle of perfume: 32.19')
      expect(receipt).to include('1 bottle of perfume: 20.89')
      expect(receipt).to include('1 packet of headache pills: 9.75')
      expect(receipt).to include('3 imported boxes of chocolates: 35.55')
      expect(receipt).to include('Sales Taxes: 7.90')
      expect(receipt).to include('Total: 98.38')
    end
  end
end
