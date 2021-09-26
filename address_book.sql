DROP database IF EXISTS address_book_service;
CREATE DATABASE  address_book_service;
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

SELECT COUNT(*) FROM address_book WHERE city = "Bangalore" and state = "Karnataka";

SELECT * FROM address_book WHERE city = "Bangalore" ORDER BY first_name, last_name;

ALTER TABLE address_book ADD (name VARCHAR(30), type VARCHAR(20));
DESCRIBE address_book;
UPDATE address_book SET name = "Book2", type = "Profession" WHERE city = "Mumbai";
UPDATE address_book SET name = "Book1", type = "Friends" WHERE city = "Bangalore";
SELECT * FROM address_book;

SELECT COUNT(*),type FROM address_book GROUP BY (type);

INSERT INTO address_book (first_name, last_name, address, city, state, zip, phone_number, email,name,type) VALUES ("Rajat","S P","2nd Cross, HosaRoad", "Bangalore", "KARNATAKA", 560100, 8934267543, "raj@gmail.com", "Book1", "Family");
SELECT * FROM address_book;

DROP TABLE IF EXISTS address_book;
DROP database IF EXISTS address_book_service;
CREATE DATABASE  address_book_service;
use address_book_service

CREATE TABLE address_book(
book_id INT unsigned NOT NULL AUTO_INCREMENT,
book_name VARCHAR(50) NOT NULL,
PRIMARY KEY(book_id));

CREATE TABLE type(
type_id INT unsigned NOT NULL AUTO_INCREMENT,
type_name VARCHAR(50) NOT NULL,
PRIMARY KEY(type_id));

CREATE TABLE contact(
contact_id INT unsigned NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number BIGINT,
email VARCHAR(320),
address_book_id INT unsigned,
PRIMARY KEY (contact_id),
FOREIGN KEY (address_book_id) REFERENCES address_book(book_id) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE TABLE contact_type(
contact_id INT unsigned NOT NULL,
type_id INT unsigned NOT NULL,
PRIMARY KEY (contact_id,type_id),
FOREIGN KEY (contact_id) REFERENCES contact(contact_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (type_id) REFERENCES type(type_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE address(
address_id INT NOT NULL AUTO_INCREMENT,
contact_id INT unsigned NOT NULL,
address VARCHAR(200) NOT NULL, city VARCHAR(30),
state VARCHAR(30),
zip INT unsigned,
PRIMARY KEY (address_id),
FOREIGN KEY (contact_id) REFERENCES contact(contact_id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO  address_book (book_name) VALUES("Book1"),("Book2");

SELECT * FROM address_book;

INSERT INTO  type (type_name) VALUES("Family"),("Friends"),("Profession");

SELECT * FROM type;

SELECT * FROM type WHERE type_name = "Family";

INSERT INTO  contact(first_name, last_name, phone_number, email, address_book_id) VALUES
("Rajat","S P",8934267543,"raj@gmail.com",1),
("Hemanth","Kumar",8937856774,"hemanthk@gmail.com",2),
("Anjali","Verma",8937126754,"anjaliverma@gmail.com",1);

SELECT * FROM contact;

INSERT INTO address(contact_id, address, city, state, zip) VALUES
(1,"2nd Cross, HosaRoad","Bangalore","KARNATAKA",560100),
(2,"2nd Street, Andheri", "Mumbai", "Maharashtra", 530160),
(3,"5th Cross, Malleshwaram","Bangalore","Karnataka",730160);

SELECT * FROM address;

INSERT INTO contact_type VALUES
(1,1),
(1,2),
(2,3),
(3,2);

SELECT * FROM contact_type;

SELECT first_name , last_name , city
FROM contact c NATURAL JOIN address
WHERE CITY = "Bangalore";

SELECT COUNT(*)
FROM contact NATURAL JOIN address
WHERE city = "Bangalore" AND state = "Karnataka";

SELECT * FROM contact NATURAL JOIN address
WHERE city = "Bangalore"
ORDER BY first_name, last_name;

SELECT type_name, COUNT(*)
FROM contact_type c NATURAL JOIN type
GROUP BY (c.type_id);


