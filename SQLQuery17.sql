-- Create the Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  join_date DATE,
  favorite_brand VARCHAR(255)
);

-- Insert data into the Users table
INSERT INTO Users (user_id, join_date, favorite_brand)
VALUES
  (1, '2018-01-01', 'Lenovo'),
  (2, '2018-02-09', 'Samsung'),
  (3, '2018-01-19', 'LG'),
  (4, '2018-05-21', 'HP');

-- Create the Orders table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  item_id INT,
  buyer_id INT,
  seller_id INT,
  FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
  FOREIGN KEY (seller_id) REFERENCES Users(user_id)
);

-- Insert data into the Orders table
INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES
  (1, '2019-08-01', 4, 1, 2),
  (2, '2018-08-02', 2, 1, 3),
  (3, '2019-08-03', 3, 2, 3),
  (4, '2018-08-04', 1, 4, 2),
  (5, '2018-08-04', 1, 3, 4),
  (6, '2019-08-05', 2, 2, 4);

-- Create the Items table
CREATE TABLE Items (
  item_id INT PRIMARY KEY,
  item_brand VARCHAR(255)
);

-- Insert data into the Items table
INSERT INTO Items (item_id, item_brand)
VALUES
  (1, 'Samsung'),
  (2, 'Lenovo'),
  (3, 'LG'),
  (4, 'HP');

-- Write a query to find the join date and the number of orders made as a buyer in 2019 for each user
SELECT
  U.user_id AS buyer_id,
  U.join_date,
  COUNT(O.order_id) AS orders_in_2019
FROM
  Users U
  LEFT JOIN Orders O ON U.user_id = O.buyer_id AND YEAR(O.order_date) = 2019
GROUP BY
  U.user_id,
  U.join_date;

