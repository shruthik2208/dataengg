CREATE TABLE Person (
  id INT PRIMARY KEY,
  email VARCHAR(255) NOT NULL
);

INSERT INTO Person (id, email)
VALUES
  (1, 'a@b.com'),
  (2, 'c@d.com'),
  (3, 'a@b.com');

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
