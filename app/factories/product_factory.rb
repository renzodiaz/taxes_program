# frozen_string_literal: true

module Factories
  class ProductFactory
    def self.create_from_input(input_line)
      # Parse input like "2 book at 12.49"
      # "1 imported bottle of perfume at 47.50"
      # pattern "{quantity} {imported:optional} of {product_name} at {price}"
      parts = input_line.strip.split(' at ')
      price = parts[1].to_f

      item_description = parts[0]
      quantity = item_description.split(' ').first.to_i

      # Remove quantity from description to get item name
      name_parts = item_description.split(' ')[1..]
      imported = name_parts.include?('imported')

      # Remove 'imported' from name if present
      name_parts.delete('imported')
      name = name_parts.join(' ')

      Models::Product.new(quantity, name, price, imported: imported)
    end
  end
end
