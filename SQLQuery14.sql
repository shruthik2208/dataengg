-- Create the Stadium table
CREATE TABLE Stadium (
  id INT PRIMARY KEY,
  visit_date DATE,
  people INT
);

-- Insert data into the Stadium table
INSERT INTO Stadium (id, visit_date, people)
VALUES
  (1, '2017-01-01', 10),
  (2, '2017-01-02', 109),
  (3, '2017-01-03', 150),
  (4, '2017-01-04', 99),
  (5, '2017-01-05', 145),
  (6, '2017-01-06', 1455),
  (7, '2017-01-07', 199),
  (8, '2017-01-09', 188);

-- Write a query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each
SELECT s1.id, s1.visit_date, s1.people
FROM Stadium AS s1
JOIN Stadium AS s2 ON s1.id = s2.id - 1
JOIN Stadium AS s3 ON s1.id = s3.id - 2
WHERE s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100
ORDER BY s1.visit_date ASC;
