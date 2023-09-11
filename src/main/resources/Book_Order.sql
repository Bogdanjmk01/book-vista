CREATE TABLE Book_Order(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(45),
    user_name VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(250),
    phone_number VARCHAR(20),
    book_name VARCHAR(50),
    author VARCHAR(50),
    price DOUBLE,
    payment_method VARCHAR(10)
);