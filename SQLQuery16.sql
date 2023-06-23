-- Create the Stocks table
CREATE TABLE Stocks (
  stock_name VARCHAR(255),
  operation ENUM('Buy', 'Sell'),
  operation_day INT,
  price INT,
  PRIMARY KEY (stock_name, operation_day)
);

-- Insert data into the Stocks table
INSERT INTO Stocks (stock_name, operation, operation_day, price)
VALUES
  ('Leetcode', 'Buy', 1, 1000),
  ('Corona Masks', 'Buy', 2, 10),
  ('Leetcode', 'Sell', 5, 9000),
  ('Handbags', 'Buy', 17, 30000),
  ('Corona Masks', 'Sell', 3, 1010),
  ('Corona Masks', 'Buy', 4, 1000),
  ('Corona Masks', 'Sell', 5, 500),
  ('Corona Masks', 'Buy', 6, 1000),
  ('Handbags', 'Sell', 29, 7000),
  ('Corona Masks', 'Sell', 10, 10000);

-- Write a query to calculate the capital gain/loss for each stock
SELECT
  stock_name,
  SUM(CASE WHEN operation = 'Sell' THEN price ELSE -price END) AS capital_gain_loss
FROM
  Stocks
GROUP BY
  stock_name;
