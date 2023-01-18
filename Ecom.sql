CREATE TABLE AdminUser(
	AdminID bigserial Primary Key not null,
	Name varchar(255),
	Email varchar(255),
	Phone varchar(255),
	AdminPosition varchar(255)
);

CREATE TABLE Customer(
	CustomerID bigserial Primary Key not null, 
	Name varchar(255),
	Phone varchar(255),
	Email varchar(255),
    CreatedOn timestamp,
    ModifiedOn timestamp
);

CREATE TABLE Notifications(
    NotificationID bigserial Primary Key not null,
    CustomerID bigserial, 
    Title varchar(255),
    Message text,
    CreatedOn timestamp,
    ModifiedOn timestamp
);

CREATE TABLE Address(
    AddressID bigserial Primary Key not null,
    Address1 varchar(255),
    Address2 varchar(255),
    Landmark varchar(255),
    City varchar(255),
    State varchar(255),
    Country varchar(255),
    ZipCode varchar(255)
);

CREATE TABLE User_Notification(
    NotificationID bigserial,
    CustomerID bigserial,
    Foreign Key (NotificationID) References Notifications(NotificationID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);

CREATE TABLE User_Address(
    AddressID bigserial,
    CustomerID bigserial, 
    Foreign Key (CustomerID) References Customer(CustomerID),
    Foreign Key (AddressID) References Address(AddressID)
);

CREATE TABLE Category(
	CategoryID bigserial Primary Key not null,
	CatagoryName varchar(255),
	Description varchar(255),
	CreatedOn timestamp,
	UpdatedOn timestamp
);

CREATE TABLE Product(
	ProductID bigserial Primary Key not null,
	CategoryID bigserial,
	ProductName varchar(255),
	ProductBrand varchar(255),
	Description text,
	Variant_specification bytea,
	CreatedOn timestamp,
	ModifiedOn timestamp,
    Foreign Key (CategoryID) References Category(CategoryID) 
);

CREATE TABLE Variant(
	VariantID bigserial Primary Key not null,
	ProductID bigserial,
	isDefault Bool,
	BestSeller Bool,
	Discount Bool,
	Price int,
	QuantityLeft int,
	Specification bytea,
    Foreign key (ProductID) References Product(ProductID)
);

CREATE TABLE Review(
    ReviewID bigserial Primary Key not null,
    Rating int,
    Review text,
    CreatedOn timestamp,
    ModifiedOn timestamp
);

CREATE TABLE Variant_Review(
    ReviewID bigserial,
    VariantID bigserial,
    Foreign Key (VariantID) References Variant(VariantID),
    Foreign Key (ReviewID) References Review(ReviewID)
);

CREATE TABLE User_Revew(
    ReviewID bigserial,
    CustomerID bigserial,
    Foreign Key (ReviewID) References Review(ReviewID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);

CREATE TABLE Order_details(
    OrderDetailsID bigserial Primary Key not null,
    VariantID bigserial,
    UnitPrice int,
    Quantity int,
    TotalPrice int,
    TotalPriceAfterDiscount int,
    Foreign Key (VariantID) References Variant(VariantID)
);
CREATE Type PayMethod as ENUM ('CashOnDelivery', 'CreditCard', 'DebitCard', 'NetBanking', 'UPI');
CREATE Type PayStatus as ENUM ('Pending', 'Success', 'Failed');

CREATE TABLE Transaction(
    TransactionID bigserial Primary Key not null,
    PaymentMethod PayMethod,
    PaymentStatus PayStatus,
    TransactionDate date,
    TransactionAmount int
);
CREATE TYPE status as ENUM('Pending', 'Dispatched', 'Delivered', 'Cancelled');
CREATE TABLE Orders(
    OrderID bigserial Primary Key not null,
    OrderDetailsID bigserial ,
    TransactionID bigserial ,
    OrderDate date,
    ShipDate date,
    ShipAddress bytea, 
    CreatedOn timestamp,
    ModifiedOn timestamp,
    Status status,
    Foreign Key (OrderDetailsID) References Order_details(OrderDetailsID),
    Foreign Key (TransactionID) References Transaction(TransactionID)
);

CREATE TABLE User_Order(
    OrderID bigserial,
    CustomerID bigserial,
 	Foreign Key (OrderID) References Orders(OrderID),
	Foreign Key (CustomerID) References Customer(CustomerID)
);

CREATE TABLE Cart(
    CartID bigserial Primary Key not null,
    VariantID bigserial,
    Quantity int,
    CreatedOn timestamp,
    ModifiedOn timestamp,
    Foreign Key (VariantID) References Variant(VariantID)
);

CREATE TABLE User_Cart(
    CartID bigserial,
    CustomerID bigserial,
    Foreign Key (CartID) References Cart(CartID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);

CREATE TYPE d_type as ENUM ('Percentage', 'Fixed');
CREATE TABLE Discount(
	DiscountID bigserial Primary Key not null,
	Type d_type,
	Vale int
);

CREATE TABLE Variant_Discount(
    DiscountID bigserial,
    VariantID bigserial,
    Foreign Key (DiscountID) References Discount(DiscountID),
    Foreign Key (VariantID) References Variant(VariantID)
);

CREATE TABLE Wishlist(
    WishlistID bigserial Primary Key not null,
    VariantID bigserial,
    CreatedOn timestamp,
    ModifiedOn timestamp,
    Foreign Key (VariantID) References Variant(VariantID)
);

CREATE TABLE User_Wishlist(
    WishlistID bigserial,
    CustomerID bigserial,
    Foreign Key (WishlistID) References Wishlist(WishlistID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);