# frozen_string_literal: true

module Services
  class TaxCalculator
    def initialize
      @receipt = Models::Receipt.new
    end

    def process_input(input_lines)
      input_lines.each do |line|
        next if line.strip.empty?

        item = Factories::ProductFactory.create_from_input(line)
        @receipt.add_item(item)
      end
    end

    def generate_receipt
      @receipt.generate
    end
  end
end
