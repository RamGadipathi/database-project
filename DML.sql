SELECT * FROM sys.Order;
INSERT INTO `sys`.`Order`
(`Order_id`,
`OrderDate`,
`OrderDeliveryDate`,
`User_id`,
`ShoppingCart_Id`)
VALUES
(12321,
'2020-11-11',
'2021-04-05',
43434324,
123456);

INSERT INTO `sys`.`Payment`
(`Payment_Id`,
`PaymentType`,
`Order_id`,
`User_id`,
`Product_ID`)
VALUES
(23342244,
'cash',
435456,
454545,
432367);
SELECT * FROM sys.Payment;

INSERT INTO `sys`.`Comment`
(`Comment_Id`,
`CommentMessage`,
`Product_ID`,
`User_id`)
VALUES
('3435452773',
'5 star product',
'432367',
'454545');
SELECT * FROM sys.Comment;

INSERT INTO `User_Info` (`User_id`,`User_InfoFirstName`,`User_InfoLstName`,`User_Infoemail`,`User_InfoPhonenum`,`User_InfoAddress`,`User_InfoCity`)
VALUES
  ("4343435","Melyssa Pruitt","Angelica Browning","vel.convallis@hotmail.edu","1-173-258-7453","233 Et Street","Sandviken"),
  ("45435454","Abraham Henson","Joshua Sargent","nulla.magna.malesuada@hotmail.com","(915) 429-4473","3526 Duis Ave","Neudörfl"),
  ("454354353","Brooke Reyes","Barrett Avila","semper.egestas@outlook.org","1-714-527-2883","9350 Gravida Road","Hard"),
  ("4543543543","Brock Decker","Carly James","ultricies.sem.magna@yahoo.com","1-234-485-5971","713-4197 Risus. Av.","Tierra Amarilla"),
  ("4534543543","Ima Hughes","Jin Mcfarland","sed.dictum.proin@hotmail.org","1-249-323-8473","P.O. Box 972, 9479 Elit Av.","Ambala Sadar"),
  ("453454353","Tanisha Bright","Quon Caldwell","eget.tincidunt@outlook.com","1-648-752-9736","Ap #647-3398 Sed Avenue","Rangiora"),
  ("4534534543","Echo Rhodes","Armand Sears","penatibus.et.magnis@icloud.ca","1-119-849-2968","231-4221 Eu, Av.","Watson Lake"),
  ("43543543","Juliet Decker","Jerry Hardin","sed.tortor@outlook.com","1-953-321-7246","2459 Quisque Rd.","Hofors"),
  ("1453545","Jessica Roberts","Dalton Mejia","non.bibendum@aol.ca","(648) 674-4897","4762 Nisl Ave","Uyo"),
  ("544446546","Ezekiel Oliver","Anthony Stuart","mauris@icloud.com","1-402-155-9466","P.O. Box 463, 5947 Ut Av.","Ciudad Madero");

INSERT INTO `sys`.`Product`
(`Product_ID`,
`ProductName`,
`ProductDescription`,
`ProductPrice`,
`User_id`)
VALUES
('345545',
'gloves',
'gloves are made with wool',
6548,
'434343');

INSERT INTO `sys`.`ShoppingCart`
(`ShoppingCart_Id`,
`ShoppingCartTotalAmount`,
`ShoppingCartTotalQty`,
`User_id`,
`Product_ID`)
VALUES
('54321',
'2999',
'4',
454545,
432367);

Output after executing Join Query:
select o.Order_id, p.Payment_Id from sys.Order o inner join sys.Payment p on o.Order_id=p.Order_id;

Update statements:
UPDATE `sys`.`Order`
SET
`Order_id` = 12345,
`OrderDate` = '2020-13-06',
`OrderDeliveryDate` = '2020-05-05',
`User_id` = 43434324,
`ShoppingCart_Id` = 123456
WHERE `Order_id` = 12321;
 

UPDATE `sys`.`Product`
SET
`Product_ID` = 345546,
`ProductName` = 'gloves',
`ProductDescription` = 'gloves are made of cotton',
`ProductPrice` = 4546,
`User_id` = 434343
WHERE `Product_ID` = 345545;

Delete statement:
DELETE FROM `sys`.`Product`
WHERE `Product_ID` = 345546;
