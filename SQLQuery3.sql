CREATE TABLE Employee2 (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  salary INT,
  managerId INT
);

INSERT INTO Employee2 (id, name, salary, managerId)
VALUES
  (1, 'Joe', 70000, 3),
  (2, 'Henry', 80000, 4),
  (3, 'Sam', 60000, NULL),
  (4, 'Max', 90000, NULL);
  
SELECT e.name AS Employee
FROM Employee2 e
JOIN Employee2 m ON e.managerId = m.id
WHERE e.salary > m.salary;
