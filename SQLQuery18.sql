-- Create Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  join_date DATE,
  favorite_brand VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  item_id INT,
  buyer_id INT,
  seller_id INT,
  FOREIGN KEY (item_id) REFERENCES Items(item_id),
  FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
  FOREIGN KEY (seller_id) REFERENCES Users(user_id)
);

-- Create Items table
CREATE TABLE Items (
  item_id INT PRIMARY KEY,
  item_brand VARCHAR(50)
);

-- Insert data into Users table
INSERT INTO Users (user_id, join_date, favorite_brand) VALUES
(1, '2018-01-01', 'Lenovo'),
(2, '2018-02-09', 'Samsung'),
(3, '2018-01-19', 'LG'),
(4, '2018-05-21', 'HP');

-- Insert data into Orders table
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id) VALUES
(1, '2019-08-01', 4, 1, 2),
(2, '2018-08-02', 2, 1, 3),
(3, '2019-08-03', 3, 2, 3),
(4, '2018-08-04', 1, 4, 2),
(5, '2018-08-04', 1, 3, 4),
(6, '2019-08-05', 2, 2, 4);

-- Insert data into Items table
INSERT INTO Items (item_id, item_brand) VALUES
(1, 'Samsung'),
(2, 'Lenovo'),
(3, 'LG'),
--(4, 'HP');