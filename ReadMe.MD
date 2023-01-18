# Database Schema

### 1. Customers
- CustomerID: bigserial Primary Key not null, 
- Name: varchar(255)
- Phone: varchar(255)
- Email: varchar(255)
- Address: [AddressID]
- Wishlist: [WishlistID]
- Orders: [OrdersID]
- Notifications: [NotificationID]
- Cart: [CartID]
- Transactions: [TransactionID]

### 2. Admin
- AdminID: bigserial Primary Key not null
- Name: varchar(255)
- Email: varchar(255)
- Phone: varchar(255)
- AdminPosition: varchar(255)

### 3. Products
- ProductID: bigserial Primary Key not null
- CategoryID: bigserial
- ProductName: varchar(255)
- ProductBrand: varchar(255)
- CreatedOn: timestamp
- ModifiedOn: timestamp
- Description: text
- Variant_specification: {field: type}
- Variant: [VariantID]
- Reivew: [ReviewID]

### 4. Variant
- VariantID: bigserial Primary Key not null
- ProductID: [ProductID]
- Default: Bool
- BestSeller: Bool
- Discount: Bool
- Price: int
- QuantityLeft: int
- Specification: bytea
- Offers: [OfferID]
- Review: [ReviewID]
- OrderDetails: [OrderDetailsID]

### 5. Categories
- CategoryID: bigserial
- ProductID: bigserial
- CategoryName: varchar(255)
- Description: varchar(255)
- CreatedOn: timestamp
- ModifiedOn: timestamp

### 6. Orders
- OrderID: bigserial Primary Key not null
- OrderDetailsID: bigserial
- TransactionID: bigserial
- OrderDate: date
- ShipDate: date
- ShipAddress: bytea
- CreatedOn: timestamp
- ModifiedOn: timestamp
- Status: status

### 7. Order Details
- OrderDetailsID: varchar(255)
- VariantID: bigserial
- UnitPrice: int
- Quantity: int
- Discount: int
- TotalPrice: int

### 8. Wishlist
- WishlistID: bigserial
- VariantID: [VariantID]

### 9. Cart
- CartID: bigserial
- CustomerID: bigserial
- VariantID: [VariantID]
- Quantity: int
- CreatedOn: timestamp
- ModifiedOn: timestamp

### 10. Address
- AddressID: bigserial
- Address1: varchar(255)
- Address2: varchar(255)
- Landmark: varchar(255)
- City: varchar(255)
- State: varchar(255)
- Country: varchar(255)
- ZipCode: varchar(255)

### 11. Notification
- NotificationID: bigserial
- CustomerID: bigserial
- Title: varchar(255)
- Description: varchar(255)

### 12. Discount
- DiscountID: bigserial Primary Key not null
- Type: ENUM(Percentage, Fixed)
- Vale: int

### 13. Review
- ReviewID: bigserial
- CustomerID: bigserial
- ProductID: bigserial Forieng Key Refenrence Product(ProductID)
- Rating: int
- Description: text
- CreatedOn: timestamp
- UpdatedOn: Timestamp

### 14. Transactions
- TransactionID: bigserial
- PaymentID: bigserial
- CustimerID: bigserial
- TransactionData: date