# Tax calculator App with Ruby
Ruby program that calculates sales tax and generates receipts.

## System requirements
- Ruby version 3.x

## Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Run tests:
   ```bash
   rspec
   ```

## Usage

Enter in IRB mode using `irb` command in your terminal

```ruby
require_relative 'app/main'

calculator = Services::TaxCalculator.new

input = [
  '2 book at 12.49',
  '1 music CD at 14.99',
  '1 chocolate bar at 0.85'
]

calculator.process_input(input)
puts calculator.generate_receipt
```
## Project Structure

```
sales-tax-calculator/
├── app/
│   ├── models/
│   │   ├── product.rb
│   │   └── receipt.rb
│   ├── services/
│   │   └── tax_generator.rb
│   ├── factories/
│   │   └── product_factory.rb
│   └── main.rb
├── spec/
│   ├── models/
│   ├── services/
│   ├── factories/
│   └── spec_helper.rb
├── Gemfile
└── README.md
```

## Design Patterns Used

- **Factory Pattern**: `ProductFactory` creates `Product` objects from input strings
- **Composition**: `Receipt` contains multiple `Product` objects
- **Single Responsibility**: Each class has one clear responsibility

## Tax Rules

- Basic sales tax: 10% on all goods except books, food, and medical products
- Import duty: Additional 5% on all imported goods
- Tax rounding: Round up to nearest 0.05
