-- Database Ecommers_store

-- DROP DATABASE IF EXISTS "Ecommers_store";

CREATE DATABASE "Ecommers_store"


CREATE TABLE AdminUser(
	AdminID bigserial Primary Key not null,
	Name varchar(100),
	Email varchar(100),
	Phone varchar(20),
	AdminPosition varchar(20)
);

CREATE TABLE Customer(
	CustomerID bigserial Primary Key not null, 
	Name varchar(100),
	Phone varchar(20),
	Email varchar(100),
    CreatedOn timestamp,
    ModifiedOn timestamp
);

CREATE TABLE Notifications(
    NotificationID bigserial Primary Key not null,
    CustomerID bigserial, 
    Title varchar(100),
    Message text,
    CreatedOn timestamp,
    ModifiedOn timestamp,
);

CREATE TABLE Address(
    AddressID bigserial Primary Key not null
    Address1 varchar(100),
    Address2 varchar(100),
    Landmark varchar(100),
    City varchar(100),
    State varchar(100),
    Country varchar(100),
    ZipCode varchar(6)
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
---------------------------------------------------

CREATE TABLE Category(
	CategoryID bigserial Primary Key not null,
	CatagoryName varchar(100),
	Description varchar(100),
	CreatedOn timestamp,
	UpdatedOn timestamp
);

CREATE TABLE Product(
	ProductID bigserial Primary Key not null,
	CategoryID bigserial,
	ProductName varchar(100),
	ProductBrand varchar(100),
	Description text,
	Variant_specification varbinary(MAX)
	CreatedOn timestamp,
	ModifiedOn timestamp,
    Foreign Key References Category(CategoryID) 
);

CREATE TABLE Variant(
	VariantID bigserial Primary Key not null,
	ProductID bigserial,
	Default Bool,
	BestSeller Bool,
	Discount Bool,
	Price int,
	QuantityLeft int,
	Specification binaryvar(max),
    Foreign key (ProductID) References Product(ProductID)
);

CREATE TABLE Review(
    ReviewID bigserial Primary Key not null,
    Rating int,
    Review text,
    CreatedOn timestamp,
    ModifiedOn timestamp,
);

CREATE TABLE Variant_Review(
    ReviewID bigserial,
    VariantID bigserial,
    Foreign Key (VariantID) References Product(VariantID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);

CREATE TABLE User_Revew(
    ReviewID bigserial,
    CustomerID bigserial,
    Foreign Key (ReviewID) References Review(ReviewID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);
---------------------------------------------------

CREATE TABLE Order_details(
    OrderDetailsID bigserial Primary Key not null,
    VariantID bigserial,
    UnitPrice int,
    Quantity int,
    TotalPrice int,
    TotalPriceAfterDiscount int,
    Foreign Key (VariantID) References Variant(VariantID)
);

CREATE TABLE Transaction(
    TransactionID bigserial Primary Key not null,
    PaymentMethod ENUM(CashOnDelivery, CreditCard, DebitCard, NetBanking, UPI),
    PaymentStatus ENUM(Pending, Success, Failed),
    TransactionDate date,
    TransactionAmount int,
);

CREATE TABLE Orders(
    OrderID bigserial Primary Key not null,
    OrderDetailsID bigserial ,
    TransactionID bigserial ,
    OrderDate date,
    ShipDate date,
    ShipAddress varbinary(max), 
    CreatedOn timestamp,
    ModifiedOn timestamp,
    Status ENUM(Pending, Dispatched, Delivered, Cancelled),
    Foreign Key (OrderDetailsID) References Order_details(OrderDetailsID)
    Foreign Key (TransactionID) References Transaction(TransactionID)
);

CREATE TABLE User_Order(
    OrderID bigserial Foreign Key References Orders(OrderID)
    CustomerID bigserial Foreign Key References Customer(CustomerID)
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
---------------------------------------------------

CREATE TABLE Discount(
	DiscountID bigserial Primary Key not null,
	Type ENUM(Percentage, Fixed),
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
    Foreign Key (VariantID) References Variant(VariantID),
);

CREATE TABLE User_Wishlist(
    WishlistID bigserial,
    CustomerID bigserial,
    Foreign Key (WishlistID) References Wishlist(WishlistID),
    Foreign Key (CustomerID) References Customer(CustomerID)
);