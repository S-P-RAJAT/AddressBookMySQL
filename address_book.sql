CREATE DATABASE  address_book;
use address_book_service
SELECT DATABASE();

CREATE TABLE address_book(id INT unsigned NOT NULL AUTO_INCREMENT, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, address VARCHAR(200), city VARCHAR(30), state VARCHAR(30), zip INT unsigned, phone_number LONG, email VARCHAR(320), PRIMARY KEY (id));
DESCRIBE address_book;

INSERT INTO address_book VALUE(1,"Rajat","S P","2nd Cross, HosaRoad","Bangalore","KARNATAKA",560100,8934267543,"raj@gmail.com");
SELECT * FROM address_book;
INSERT INTO address_book (first_name, last_name, address, city, state, zip, phone_number, email) VALUES ("Pradeep","Nayar","2nd Cross, Yelahanka","Bangalore","KARNATAKA",562130,8434227543,"pradeep@gmail.com"),("Anjali","Verma","5th Cross, Malleshwaram","Bangalore","Karnataka",730160,8937126754,"anjaliverma@gmail.com"),("Hemanth","Kumar","2nd Street, Andheri","Mumbai","Maharashtra",530160,8937856774,"hemanthk@gmail.com");
SELECT * FROM address_book;

UPDATE address_book SET zip = 560213 WHERE first_name = "Pradeep" AND last_name = "Nayar";
SELECT * FROM address_book;

DELETE  FROM  address_book WHERE first_name = "Pradeep" AND last_name = "Nayar";
SELECT * FROM address_book;

SELECT first_name , last_name , city FROM address_book WHERE CITY = "Bangalore";
SELECT first_name , last_name , city, state FROM address_book WHERE state = "Karnataka";
