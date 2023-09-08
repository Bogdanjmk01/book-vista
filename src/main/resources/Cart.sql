CREATE TABLE Cart(
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  book_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  book_name VARCHAR(60) NOT NULL,
  author VARCHAR(60) NOT NULL,
  price DOUBLE NOT NULL,
  total_price DOUBLE,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);