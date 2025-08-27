# frozen_string_literal: true

module Models
  class Product
    attr_reader :quantity, :name, :price, :imported

    def initialize(quantity, name, price, imported: false)
      @quantity = quantity
      @name = name
      @price = price
      @imported = imported
    end

    def exempt?
      exempt_keywords = %w[book chocolate pills]
      exempt_keywords.any? { |keyword| name.downcase.include?(keyword) }
    end

    def imported?
      @imported
    end

    def total_price_with_tax
      tax_amount = calculate_tax
      (price + tax_amount) * quantity
    end

    def total_tax
      calculate_tax * quantity
    end

    private

    def calculate_tax
      basic_tax = exempt? ? 0 : 0.10
      import_tax = imported? ? 0.05 : 0
      total_tax_rate = basic_tax + import_tax

      return 0 if total_tax_rate.zero?

      raw_tax = price * total_tax_rate
      round_up(raw_tax)
    end

    # Round up nearest 005
    def round_up(amount)
      (amount / 0.05).ceil * 0.05
    end
  end
end
