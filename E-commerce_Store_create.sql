-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-16 05:19:47.064

-- tables
-- Table: Comment
CREATE TABLE Comment (
    Comment_Id int NOT NULL,
    CommentMessage varchar(30) NOT NULL,
    Product_ID int NOT NULL,
    User_id int NOT NULL,
    CONSTRAINT Comment_pk PRIMARY KEY (Comment_Id)
);

-- Table: Order
CREATE TABLE `Order` (
    Order_id int NOT NULL,
    OrderDate date NULL,
    OrderDeliveryDate date NULL,
    User_id int NOT NULL,
    ShoppingCart_Id int NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (Order_id)
);

-- Table: Payment
CREATE TABLE Payment (
    Payment_Id int NOT NULL,
    PaymentType int NOT NULL,
    Order_id int NOT NULL,
    User_id int NOT NULL,
    Product_ID int NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (Payment_Id)
);

-- Table: Product
CREATE TABLE Product (
    Product_ID int NOT NULL,
    ProductName varchar(20) NULL,
    ProductDescription varchar(70) NOT NULL,
    ProductPrice decimal(10,4) NULL,
    User_id int NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY (Product_ID)
);

-- Table: ShoppingCart
CREATE TABLE ShoppingCart (
    ShoppingCart_Id int NOT NULL,
    ShoppingCartTotalAmount int NULL,
    ShoppingCartTotalQty int NULL,
    User_id int NOT NULL,
    Product_ID int NOT NULL,
    CONSTRAINT ShoppingCart_pk PRIMARY KEY (ShoppingCart_Id)
);

-- Table: User_Info
CREATE TABLE User_Info (
    User_id int NOT NULL,
    User_InfoFirstName varchar(12) NULL,
    User_InfoLstName varchar(12) NULL,
    User_Infoemail varchar(12) NULL,
    User_InfoBirthDate date NOT NULL,
    User_InfoPhoneNum decimal(10,0) NULL,
    User_InfoAddress varchar(12) NULL,
    User_InfoCity varchar(12) NULL,
    CONSTRAINT User_Info_pk PRIMARY KEY (User_id)
);

-- foreign keys
-- Reference: Comment_Product (table: Comment)
ALTER TABLE Comment ADD CONSTRAINT Comment_Product FOREIGN KEY Comment_Product (Product_ID)
    REFERENCES Product (Product_ID);

-- Reference: Comment_User_Info (table: Comment)
ALTER TABLE Comment ADD CONSTRAINT Comment_User_Info FOREIGN KEY Comment_User_Info (User_id)
    REFERENCES User_Info (User_id);

-- Reference: Order_ShoppingCart (table: Order)
ALTER TABLE `Order` ADD CONSTRAINT Order_ShoppingCart FOREIGN KEY Order_ShoppingCart (ShoppingCart_Id)
    REFERENCES ShoppingCart (ShoppingCart_Id);

-- Reference: Order_User_Info (table: Order)
ALTER TABLE `Order` ADD CONSTRAINT Order_User_Info FOREIGN KEY Order_User_Info (User_id)
    REFERENCES User_Info (User_id);

-- Reference: Payment_Order (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Order FOREIGN KEY Payment_Order (Order_id)
    REFERENCES `Order` (Order_id);

-- Reference: Payment_Product (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Product FOREIGN KEY Payment_Product (Product_ID)
    REFERENCES Product (Product_ID);

-- Reference: Payment_User_Info (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_User_Info FOREIGN KEY Payment_User_Info (User_id)
    REFERENCES User_Info (User_id);

-- Reference: Product_User_Info (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_User_Info FOREIGN KEY Product_User_Info (User_id)
    REFERENCES User_Info (User_id);

-- Reference: ShoppingCart_Product (table: ShoppingCart)
ALTER TABLE ShoppingCart ADD CONSTRAINT ShoppingCart_Product FOREIGN KEY ShoppingCart_Product (Product_ID)
    REFERENCES Product (Product_ID);

-- Reference: ShoppingCart_User_Info (table: ShoppingCart)
ALTER TABLE ShoppingCart ADD CONSTRAINT ShoppingCart_User_Info FOREIGN KEY ShoppingCart_User_Info (User_id)
    REFERENCES User_Info (User_id);

-- End of file.

