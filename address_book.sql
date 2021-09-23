CREATE DATABASE  address_book;
use address_book_service
SELECT DATABASE();

CREATE TABLE address_book(id INT unsigned NOT NULL AUTO_INCREMENT, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, address VARCHAR(200), city VARCHAR(30), state VARCHAR(30), zip INT unsigned, phone_number LONG, email VARCHAR(320), PRIMARY KEY (id));
DESCRIBE address_book;