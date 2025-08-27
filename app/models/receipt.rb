# frozen_string_literal: true

module Models
  class Receipt
    attr_reader :items

    def initialize
      @items = []
    end

    def add_item(item)
      @items << item
    end

    def total_sales_tax
      @items.sum(&:total_tax)
    end

    def total_cost
      @items.sum(&:total_price_with_tax)
    end

    def generate
      output = []

      @items.each do |item|
        formatted_price = format('%.2f', item.total_price_with_tax)
        prefix = item.imported? ? 'imported ' : ''
        output << "#{item.quantity} #{prefix}#{item.name}: #{formatted_price}"
      end

      output << "Sales Taxes: #{format('%.2f', total_sales_tax)}"
      output << "Total: #{format('%.2f', total_cost)}"

      output.join("\n")
    end
  end
end
