# Database Schema

### 1. Customers
| Field | Datatype | 
| ---- | ---- |
| customerId | ```bigserial PRIMARY KEY not null``` | 
| name |  ```varchar(255)``` |
| phone |  ```varchar(255)``` |
| email |  ```varchar(255)``` |
| address |  ```[ AddressID ]``` |
| wishlist | ``` [WishlistID]``` |
| orders |  ```[OrdersID]``` |
| notifications |  ```[NotificationID]``` |
| cart |  ```[CartID]``` |
| transactions |  ```[TransactionID]``` |
| review | ```[reviewId]``` |

### 2. Admin
| Field | Datatype | 
| ---- | ---- |
| adminId | ```bigserial PRIMARY KEY not null``` |
| name | ```varchar(255)``` | 
| email | ```varchar(255)``` | 
| phone | ```varchar(255)``` | 
| adminPosition | ```varchar(255)``` | 

### 3. Products
| Field | Datatype | 
| ---- | ---- |
| productID |  ```bigserial PRIMARY KEY not null``` |
| categoryID |  ```bigserial``` |
| productName |  ```varchar(255)``` |
| productBrand |  ```varchar(255)``` |
| createdOn |  ```timestamp``` |
| modifiedOn |  ```timestamp``` |
| description |  ```text``` |
| variant_specification |  ```{field: type}``` |
| variant |  ```[variantID]``` |

### 4. Variant
| Field | Datatype | 
| ---- | ---- |
| variantID |    ```bigserial PRIMARY KEY not null``` |
| default |  ```Bool``` |
| bestSeller |  ```Bool``` |
| discount |  ```Bool``` |
| price |  ```int``` |
| quantityLeft |  ```int``` |
| specification |  ```bytea``` |
| offers |  ```[offerID]``` |
| review |  ```[reviewID]``` |
| orderDetails |  ```[OrderDetailsID]``` |

### 5. Categories
| Field | Datatype | 
| ---- | ---- |
| categoryID | ```bigserial PRIMARY KEY not null``` |
| categoryName | ```varchar(255)``` |
| description | ```varchar(255)``` |
| createdOn | ```timestamp``` |
| modifiedOn | ```timestamp``` |
| products | ```[ productId ]``` |

### 6. Orders
| Field | Datatype | 
| ---- | ---- |
| orderId | ```bigserial Primary Key not null``` |
| transactionId | ```bigserial``` |
| variantId | ```bigserial``` |
| orderDate | ```date ``` |
| shipDate | ```date``` |
| shipAddress | ```bytea``` |
| status | ```ENUM('Pending', 'Dispatched', 'Delivered', 'Cancelled')``` |
| quantity | ```int``` |
| unitPrice | ```int``` |
| FinalPrice | ```int``` |
| createdOn | ```timestamp``` |
| modifiedOn | ```timestamp``` |

### 8. Wishlist
| Field | Datatype | 
| ---- | ---- |
| wishlistID | ```bigserial``` |
| variantID | ```[VariantID]``` |

### 9. Cart
| Field | Datatype | 
| ---- | ---- |
| cartID | ```bigserial``` |
| cartItems | ```[cartItemId]``` |

### 10. CartItem
| Field | Datatype | 
| ---- | ---- |
| cartItemId | ```bigserial``` |
| variantId | ```bigserial``` |
| quantity | ```int``` |
| createdOn | ```timestamp``` |
| modifiedOn | ```timestamp``` |

### 10. Address
| Field | Datatype | 
| ---- | ---- |
| addressId | ```bigserial``` |
| address1 | ```varchar(255)``` |
| address2 | ```varchar(255)``` |
| landmark | ```varchar(255)``` |
| city | ```varchar(255)``` |
| state | ```varchar(255)``` |
| country | ```varchar(255)``` |
| zipCode | ```varchar(255)``` |

### 11. Notification
| Field | Datatype | 
| ---- | ---- |
| notificationID | ```bigserial``` |
| title | ```varchar(255)``` |
| description | ```varchar(255)``` |

### 12. Discount
| Field | Datatype | 
| ---- | ---- |
| discountId | ```bigserial Primary Key not null``` |
| type | ```ENUM(Percentage, Fixed)``` |
| vale | ```int``` |

### 13. Review
| Field | Datatype | 
| ---- | ---- |
| reviewId | ```bigserial``` |
| rating | ```int``` |
| description | ```text``` |
| createdOn | ```timestamp``` |
| updatedOn | ```Timestamp``` |

### 14. Transactions
| Field | Datatype | 
| ---- | ---- |
| transactionID | ```bigserial``` |
| paymentMethod | ```ENUM('CashOnDelivery', 'CreditCard', 'DebitCard', 'NetBanking', 'UPI')``` |
| paymentStatus | ```ENUM('Pending', 'Success', 'Failed')``` |
| TransactionDate | ```date``` |
| TransactionAmount | ```int``` |