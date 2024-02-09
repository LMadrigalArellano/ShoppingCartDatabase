CREATE SCHEMA shoppingcart;

USE shoppingcart;

CREATE TABLE shoppingcart.USERS (
	USER_ID INT NOT NULL AUTO_INCREMENT,#VERIFY WHAT'S GOING ON WITH THE AUTO_INCREMENT AND NUMERIC DATATYPE
    NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50),
    BIO VARCHAR(200),
    EMAIL VARCHAR(200) NOT NULL,
    AREA_OF_INTEREST VARCHAR(300),
    PRIMARY KEY (USER_ID)
);

######### START OF EXTRA CODE, DO NOT RUN ########################################################################
INSERT INTO users (name, last_name, bio, email, area_of_interest) VALUES (1, "Leo", "Madrigal", "Bio", "leo@leo.com", "Interest");

DROP TABLE users;
######### START OF EXTRA CODE, DO NOT RUN ########################################################################

CREATE TABLE shoppingcart.PRODUCTS(
	PRODUCT_ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR (100) NOT NULL,
    PRICE NUMERIC(10) NOT NULL,
    IMAGE LONGBLOB,
    DESCRIPTION VARCHAR(200),
    TOTAL_PRODUCTS_INVENTORY NUMERIC(10) NOT NULL,
    STATUS BOOLEAN NOT NULL,
    PRIMARY KEY (PRODUCT_ID)
);

######### START OF EXTRA CODE, DO NOT RUN ########################################################################

INSERT INTO products (product_id, name, price, description, total_products_inventory, status) VALUES (1, "Product1", 333, "Description", 1, true);

SELECT * FROM products WHERE price BETWEEN 1 AND 333;

DELETE FROM products WHERE product_id = 1;
DELETE FROM products WHERE product_id = 2;
DELETE FROM products WHERE product_id = 3;

######### END OF EXTRA CODE, DO NOT RUN ########################################################################


CREATE TABLE shoppingcart.ORDER_HISTORY(
	ORDER_ID INT NOT NULL AUTO_INCREMENT,
    ORDER_DATE DATE NOT NULL,
    USER_ID INT,
    PRODUCT_ID INT,
    PRIMARY KEY (ORDER_ID)-- ORDER ID ES LA ID PRINCIPAL, ESTABA PRODUCT ID
);

######### START OF EXTRA CODE, DO NOT RUN ########################################################################
INSERT INTO shoppingcart.ORDER_HISTORY (order_date, user_id, product_id) VALUES (CURDATE(), 1, 6);
INSERT INTO shoppingcart.ORDER_HISTORY (order_date, user_id, product_id) VALUES (CURDATE(), 1, 6);
INSERT INTO shoppingcart.ORDER_HISTORY (order_date, user_id, product_id) VALUES (CURDATE(), 1, 6);


SELECT * FROM shoppingcart.ORDER_HISTORY;

DELETE FROM shoppingcart.ORDER_HISTORY WHERE order_id = 1;
DROP TABLE shoppingcart.ORDER_HISTORY;
######### END OF EXTRA CODE, DO NOT RUN ########################################################################


ALTER TABLE shoppingcart.ORDER_HISTORY
ADD FOREIGN KEY (USER_ID) REFERENCES shoppingcart.USERS(USER_ID),
ADD FOREIGN KEY (PRODUCT_ID) REFERENCES shoppingcart.PRODUCTS(PRODUCT_ID);


######### START OF EXTRA CODE, DO NOT RUN ########################################################################
SELECT * FROM users;

DELETE FROM users WHERE user_id=1;
DELETE FROM users WHERE user_id=2;
DELETE FROM users WHERE user_id=3;

SELECT DATABASE();
SELECT SCHEMA();

DROP DATABASE shoppingcart;
######### END OF EXTRA CODE, DO NOT RUN ########################################################################
