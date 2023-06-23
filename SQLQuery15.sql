-- Create the Trips table
CREATE TABLE Trips (
  id INT PRIMARY KEY,
  client_id INT,
  driver_id INT,
  city_id INT,
  status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'),
  request_at DATE
);

-- Create the Users table
CREATE TABLE Users (
  users_id INT PRIMARY KEY,
  banned ENUM('Yes', 'No'),
  role ENUM('client', 'driver', 'partner')
);

-- Insert data into the Trips table
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at)
VALUES
  (1, 1, 10, 1, 'completed', '2013-10-01'),
  (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
  (3, 3, 12, 6, 'completed', '2013-10-01'),
  (4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
  (5, 1, 10, 1, 'completed', '2013-10-02'),
  (6, 2, 11, 6, 'completed', '2013-10-02'),
  (7, 3, 12, 6, 'completed', '2013-10-02'),
  (8, 2, 12, 12, 'completed', '2013-10-03'),
  (9, 3, 10, 12, 'completed', '2013-10-03'),
  (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

-- Insert data into the Users table
INSERT INTO Users (users_id, banned, role)
VALUES
  (1, 'No', 'client'),
  (2, 'Yes', 'client'),
  (3, 'No', 'client'),
  (4, 'No', 'client'),
  (10, 'No', 'driver'),
  (11, 'No', 'driver'),
  (12, 'No', 'driver'),
  (13, 'No', 'driver');

-- Write a query to calculate the cancellation rate of requests with unbanned users each day between "2013-10-01" and "2013-10-03"
SELECT
  t.request_at AS Day,
  ROUND(COUNT(CASE WHEN t.status LIKE 'cancelled%' AND u1.banned = 'No' AND u2.banned = 'No' THEN 1 END) / COUNT(CASE WHEN u1.banned = 'No' AND u2.banned = 'No' THEN 1 END), 2) AS `Cancellation Rate`
FROM
  Trips AS t
JOIN
  Users AS u1 ON t.client_id = u1.users_id
JOIN
  Users AS u2 ON t.driver_id = u2.users_id
WHERE
  t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
  t.request_at;
