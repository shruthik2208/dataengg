-- Create the Seat table
CREATE TABLE Seat (
  id INT PRIMARY KEY,
  student VARCHAR(255)
);

-- Insert data into the Seat table
INSERT INTO Seat (id, student)
VALUES
  (1, 'Abbot'),
  (2, 'Doris'),
  (3, 'Emerson'),
  (4, 'Green'),
  (5, 'Jeames');

-- Create a temporary table to store the swapped seat IDs
CREATE TEMPORARY TABLE TempSeat (
  id INT PRIMARY KEY,
  student VARCHAR(255)
);

-- Swap the seat IDs of consecutive students and store the results in the temporary table
INSERT INTO TempSeat (id, student)
SELECT 
  CASE WHEN s1.id % 2 = 1 THEN s1.id + 1 ELSE s1.id - 1 END AS id,
  s1.student
FROM Seat AS s1
JOIN Seat AS s2 ON s1.id = s2.id - 1;

-- Retrieve the result from the temporary table
SELECT id, student
FROM TempSeat
ORDER BY id ASC;

-- Drop the temporary table
DROP TABLE TempSeat;
