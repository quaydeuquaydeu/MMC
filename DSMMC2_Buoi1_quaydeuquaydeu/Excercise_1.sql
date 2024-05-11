/* Exercise 1: Design a table
Tạo Database có tên là Sale_Management có các tables sau:
*/
DROP DATABASE IF EXISTS Sale_Management;
CREATE DATABASE Sale_Management;
USE Sale_Management;

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers`(
	customerID              INT,
    first_name              VARCHAR(10)
    last_name               VARCHAR(10)
    email_address           CHAR
    number_of_complaints	INT,
);

DROP TABLE IF EXISTS `SALES`;
CREATE TABLE `SALES`(
	purchase_number			INT,
    date_of_purchase		DATE,
    customer_id				INT,
    item_code				VARCHAR(10)
);

DROP TABLE IF EXISTS `Items`;
CREATE TABLE `Items`(
	item_code				VARCHAR(10)
    item                    CHAR,
    unit_price_usd          INT,
    company_id  			INT,
    company                 VARCHAR(10),
    headquarters            VARCHAR(10),
    headquarters            VARCHAR(50)
);

-- add data Customers
INSERT INTO Customers (customerID      ,first_name      ,last_name      , email_address             , number_of_complaints)
VALUES                  ('1'            , 'John'        , 'McKinley'    , 'john.mackinley@365careers.com' , '0'),
                        ('2'            , 'Elizabeth'   , 'McFarlane'   , 'e.mcfariane@365careers.com'    , '2'),
                        ('3'            , 'Kevin'       , 'Lawrence'    , 'kevin.lawrence@365careers.com' , '1'),
                        ('4'            , 'Catherine'   , 'Winnfield'   , 'c.winfield@365careers.com'     , '0');

-- add data SALES
INSERT INTO SALES   (purchase_number, date_of_purchase, customer_id, item_code)
VALUES              ('03/09/2016'   , '1'               , 'A_1'),
                    ('02/12/2016'   , '2'               , 'C_1'),
                    ('15/04/2017'   , '3'               , 'D_1'),
                    ('24/05/2017'   , '1'               , 'B_2'),
                    ('25/05/2017'   , '4'               , 'B_2'),
                    ('06/06/2017'   , '2'               , 'B_1'),
                    ('10/06/2017'   , '4'               , 'A_2'),
                    ('13/06/2017'   , '3'               , 'C_1'),
                    ('20/07/2017'   , '1'               , 'A_1'),
                    ('11/08/2017'   , '2'               , 'B_1');
-- add data Items
INSERT INTO Items (item_code        , item          , unit_price_usd, company_id, company    , headquarters_phone_number)
VALUES            ('A_1'            , 'Lamp'        , '20'          , '1'       , 'Company A', +1 (202) 555-0196),
                  ('A_2'            , 'Desk'        , '250'         , '1'       , 'Company A', +1 (202) 555-0196),
                  ('B_1'            , 'Lamp'        , '30'          , '2'       , 'Company B', +1 (202) 555-0152),
                  ('B_2'            , 'Desk'        , '350'         , '2'       , 'Company B', +1 (202) 555-0152),
                  ('C_1'            , 'Chair'       , '150'         , '3'       , 'Company C', +1 (229) 853-9913),
                  ('D_1'            , 'Loudspeakers', '400'         , '4'       , 'Company D', +1 (618) 369-7392),
             