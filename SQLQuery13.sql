-- Create the Logs table
CREATE TABLE Logs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  num VARCHAR(255)
);

-- Insert data into the Logs table
INSERT INTO Logs (num)
VALUES
  ('1'),
  ('1'),
  ('1'),
  ('2'),
  ('1'),
  ('2'),
  ('2');

-- Write a query to find all numbers that appear at least three times consecutively
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2 ON l1.id = l2.id - 1
JOIN Logs AS l3 ON l2.id = l3.id - 1
WHERE l1.num = l2.num AND l2.num = l3.num;
