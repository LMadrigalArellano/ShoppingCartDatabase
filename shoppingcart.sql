CREATE SCHEMA shoppingcart;

USE shoppingcart;

CREATE TABLE shoppingcart.USERS (
	USER_ID NUMERIC(10) NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50),
    BIO VARCHAR(200),
    EMAIL VARCHAR(200) NOT NULL,
    AREA_OF_INTEREST VARCHAR(300),
    PRIMARY KEY (USER_ID)
);
INSERT INTO users (user_id, name, last_name, bio, email, area_of_interest) VALUES (1, "Leo", "Madrigal", "Bio", "leo@leo.com", "Interest");

DROP TABLE users;

CREATE TABLE shoppingcart.PRODUCTS(
	PRODUCT_ID NUMERIC(10) NOT NULL,
    NAME VARCHAR (100) NOT NULL,
    PRICE NUMERIC(10) NOT NULL,
    IMAGE LONGBLOB,
    DESCRIPTION VARCHAR(200),
    TOTAL_PRODUCTS_INVENTORY NUMERIC(10) NOT NULL,
    STATUS BOOLEAN NOT NULL,
    PRIMARY KEY (PRODUCT_ID)
);

INSERT INTO products (product_id, name, price, description, total_products_inventory, status) VALUES (1, "Product1", 333, "Description", 1, true);

SELECT * FROM products WHERE price BETWEEN 1 AND 333;


CREATE TABLE shoppingcart.ORDER_HISTORY(
	ORDER_ID NUMERIC(10) NOT NULL,
    ORDER_DATE DATE NOT NULL,
    USER_ID NUMERIC (10),
    PRODUCT_ID NUMERIC (10),
    PRIMARY KEY (ORDER_ID)-- ORDER ID ES LA ID PRINCIPAL, ESTABA PRODUCT ID
);

INSERT INTO shoppingcart.ORDER_HISTORY (order_id, order_date, user_id, product_id) VALUES (1, CURDATE(), 1, 1);
INSERT INTO shoppingcart.ORDER_HISTORY (order_id, order_date, user_id, product_id) VALUES (2, CURDATE(), 1, 1);
INSERT INTO shoppingcart.ORDER_HISTORY (order_id, order_date, user_id, product_id) VALUES (3, CURDATE(), 1, 1);


SELECT * FROM shoppingcart.ORDER_HISTORY;

DELETE FROM shoppingcart.ORDER_HISTORY WHERE order_id = 1;
DROP TABLE shoppingcart.ORDER_HISTORY;

ALTER TABLE shoppingcart.ORDER_HISTORY
ADD FOREIGN KEY (USER_ID) REFERENCES shoppingcart.USERS(USER_ID),
ADD FOREIGN KEY (PRODUCT_ID) REFERENCES shoppingcart.PRODUCTS(PRODUCT_ID);

SELECT * FROM users;

DELETE FROM users WHERE user_id=1;
DELETE FROM users WHERE user_id=2;
DELETE FROM users WHERE user_id=3;

SELECT DATABASE();
SELECT SCHEMA();

DROP DATABASE shoppingcart;