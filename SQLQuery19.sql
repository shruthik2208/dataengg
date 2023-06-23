-- Create the Tree table
CREATE TABLE Tree (
  id INT PRIMARY KEY,
  p_id INT
);

-- Insert data for Example 1
INSERT INTO Tree (id, p_id) VALUES (1, NULL);
INSERT INTO Tree (id, p_id) VALUES (2, 1);
INSERT INTO Tree (id, p_id) VALUES (3, 1);
INSERT INTO Tree (id, p_id) VALUES (4, 2);
INSERT INTO Tree (id, p_id) VALUES (5, 2);

-- Insert data for Example 2
-- Uncomment the following lines if you want to insert data for Example 2
-- INSERT INTO Tree (id, p_id) VALUES (1, NULL);