CREATE TABLE Cinema (
   id INT PRIMARY KEY,
   movie VARCHAR(255),
   description VARCHAR(255),
   rating DECIMAL(4,2)
);


INSERT INTO Cinema (id, movie, description, rating)
VALUES
  (1, 'War', 'great 3D', 8.9),
  (2, 'Science', 'fiction', 8.5),
  (3, 'irish', 'boring', 6.2),
  (4, 'Ice song', 'Fantasy', 8.6),
  (5, 'House card', 'Interesting', 9.1);

SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 = 1 AND description <> 'boring'
ORDER BY rating DESC;
