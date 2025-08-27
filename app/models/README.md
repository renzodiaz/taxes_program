# Models
**Purpose**: Contains the core domain objects that represent the business entities and rules.

`product.rb`

**Responsibility**: Represents a purchasable item with all its properties and tax calculation logic
**Key Features**:
- Encapsulates product data (quantity, name, price, import status)
- Contains business logic for tax exemption rules
- Calculates individual and total tax amounts
- Implements tax rounding rules (rounds up to nearest 0.05)

`receipt.rb`

**Responsibility**: Represents a collection of products with aggregated calculations and formatting
**Key Features**:
- Manages a collection of products
- Calculates total taxes across all products
- Calculates total cost across all products
- Formats the receipt output according to requirements
