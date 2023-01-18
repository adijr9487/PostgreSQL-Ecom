## 1. Customers
- CustomerID: bigserial Primary Key not null, 
- Name: varchar(100)
- Phone: varchar(20)
- Email: varchar(100)
- Address: [AddressID]
- Wishlist: [WishlistID]
- Orders: [OrdersID]
- Notifications: [NotificationID]
- Cart: [CartID]
- Transactions: [TransactionID]

## 2. Admin
- AdminID: bigserial Primary Key not null
- Name: varchar(100)
- Email: varchar(100)
- Phone: varchar(20)
- AdminPosition: varchar(20)

## 3. Products
- ProductID: bigserial Primary Key not null
- CategoryID: bigserial
- ProductName: varchar(100)
- ProductBrand: varchar(100)
- CreatedOn: timestamp
- ModifiedOn: timestamp
- Description: text
- Variant_specification: [field: type]
- Review: [ReviewID]


## 4. Variant
- VariantID: bigserial Primary Key not null
- ProductID: bigserial Foreign key Reference Product(ProductID)
- Default: Bool
- BestSeller: Bool
- Discount: Bool
- Price: int
- QuantityLeft: int
- Specification: binaryvar(max)
- Offers: [OfferID]

## 5. Categories
- CategoryID: bigserial
- ProductID: bigserial
- CategoryName: varchar(100)
- Description: varchar(100)
- CreatedOn: timestamp
- ModifiedOn: timestamp

## 6. Orders
- OrderID: bigserial Primary Key not null
- OrderDetailsID: bigserial
- TransactionID: bigserial
- OrderDate: date
- ShipDate: date
- ShipAddress: bytea
- CreatedOn: timestamp
- ModifiedOn: timestamp
- Status: status

## 7. Order Details
- OrderDetailsID: varchar(10)
- VariantID: bigserial
- UnitPrice: int
- Quantity: int
- Discount: int
- TotalPrice: int

## 8. Wishlist
- WishlistID: bigserial
- VariantID: bigserial

## 9. Cart
- CartID: bigserial
- CustomerID: bigserial
- VariantID: bigserial
- Quantity: int
- CreatedOn: timestamp
- ModifiedOn: timestamp

## User_Address
- CustomerID: bigserial Foreign Key Reference not null,
- AddressID: bigserial Foreign Key Reference not null,

## 10. Address
- AddressID: bigserial
- CustomerID: bigserial
- Address1: varchar(100)
- Address2: varchar(100)
- Landmark: varchar(100)
- City: varchar(100)
- State: varchar(100)
- Country: varchar(100)
- ZipCode: varchar(6)

## 11. Notification
- NotificationID: bigserial
- CustomerID: bigserial
- Title: varchar(200)
- Description: varchar(1000)

## 12. Discount
- DiscountID: bigserial Primary Key not null
- Type: ENUM(Percentage, Fixed)
- Vale: int

## 13. Review
- ReviewID: bigserial
- CustomerID: bigserial
- ProductID: bigserial Forieng Key Refenrence Product(ProductID)
- Rating: int
- Description: text
- CreatedOn: timestamp
- UpdatedOn: Timestamp

## 14. Transactions
- TransactionID: bigserial
- PaymentID: bigserial
- CustimerID: bigserial
- TransactionData: date