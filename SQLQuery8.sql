CREATE TABLE if not exists Department2 (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO Department2 (id, name)
VALUES
 (1, 'IT'),
 (2, 'Sales');

CREATE TABLE if not exists Employee3 (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  salary INT,
  departmentId INT,
  FOREIGN KEY (departmentId) REFERENCES Department2(id)
);

INSERT INTO Employee3 (id, name, salary, departmentId)
VALUES
  (2, 'Jim', 90000, 1),
  (3, 'Henry', 80000, 2),
  (4, 'Sam', 60000, 2),
  (5, 'Max', 90000, 1);
  
  
SELECT d.name AS Department2, e.name AS Employee3, e.salary AS Salary
FROM Employee3 e
JOIN Department2 d ON e.departmentId = d.id
WHERE e.salary = (
  SELECT MAX(salary)
  FROM Employee3
  WHERE departmentId = e.departmentId
)
ORDER BY Department2;
