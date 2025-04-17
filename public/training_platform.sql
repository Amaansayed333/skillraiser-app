create database training_platform;
use training_platform;

CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  age int,
  role VARCHAR(50)
);

CREATE TABLE UserSkills (
  skill_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  skill VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Trainings (
  training_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  category VARCHAR(50),
  duration_minutes INT,
  skill_required VARCHAR(50),
  date_created DATE
);

CREATE TABLE UserTrainingProgress (
  progress_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  training_id INT,
  progress_percent INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (training_id) REFERENCES Trainings(training_id)
);

INSERT INTO Users (name, age, role) VALUES
('Amaan', 23, 'Frontend Developer'),
('Zara', 25, 'Data Analyst'),
('Ravi', 28, 'Backend Developer'),
('Nina', 24, 'UI/UX Designer'),
('Kabir', 30, 'DevOps Engineer'),
('Alina', 27, 'Mobile Developer'),
('Farhan', 26, 'Machine Learning Engineer'),
('Jaya', 29, 'Product Manager'),
('Leo', 24, 'Data Scientist'),
('Meena', 25, 'Cybersecurity Analyst'),
('Arjun', 31, 'Software Tester'),
('Sana', 22, 'Cloud Architect'),
('Ritu', 26, 'Full Stack Developer'),
('Sam', 27, 'AI Researcher'),
('Neha', 28, 'Business Analyst');

select * from users;

INSERT INTO UserSkills (user_id, skill) VALUES
(1, 'React'), (1, 'CSS'), (1, 'JavaScript'),
(2, 'SQL'), (2, 'Python'), (2, 'Excel'),
(3, 'Node.js'), (3, 'Express'), (3, 'MongoDB'),
(4, 'Figma'), (4, 'Adobe XD'), (4, 'HTML'),
(5, 'AWS'), (5, 'Docker'), (5, 'Kubernetes'),
(6, 'Flutter'), (6, 'Dart'), (6, 'Firebase'),
(7, 'TensorFlow'), (7, 'Python'), (7, 'Numpy'),
(8, 'Agile'), (8, 'JIRA'), (8, 'Scrum'),
(9, 'Python'), (9, 'Pandas'), (9, 'Machine Learning'),
(10, 'Networking'), (10, 'Cybersecurity'), (10, 'Ethical Hacking'),
(11, 'Selenium'), (11, 'JUnit'), (11, 'Postman'),
(12, 'AWS'), (12, 'Azure'), (12, 'GCP'),
(13, 'React'), (13, 'Node.js'), (13, 'MongoDB'),
(14, 'Deep Learning'), (14, 'NLP'), (14, 'Python'),
(15, 'Excel'), (15, 'SQL'), (15, 'Power BI');




INSERT INTO UserTrainingProgress (user_id, training_id, progress_percent) VALUES
(1, 1, 40), -- Amaan - React Basics
(1, 2, 60), -- Amaan - CSS
(2, 4, 90), -- Zara - SQL
(2, 5, 100), -- Zara - Python
(3, 6, 50), -- Ravi - Node.js
(5, 7, 70), -- Kabir - AWS
(5, 8, 20), -- Kabir - Docker
(6, 9, 45), -- Alina - Flutter
(7, 10, 30), -- Farhan - TensorFlow
(9, 5, 80), -- Leo - Python
(11, 12, 90); -- Arjun - Selenium


SELECT 
    title, 
    skill_required, 
    COUNT(*) as count
FROM Trainings
GROUP BY title, skill_required
HAVING COUNT(*) > 1;

DELETE t1
FROM Trainings t1
JOIN Trainings t2 
  ON t1.title = t2.title 
  AND t1.skill_required = t2.skill_required 
  AND t1.training_id > t2.training_id;

select * from trainings;
select * from users;

use training_platform;

SELECT 
  t.training_id,
  t.title,
  t.category,
  t.duration_minutes,
  t.skill_required,
  t.date_created,
  COALESCE(p.progress_percent, 0) AS progress_percent
FROM Trainings t
JOIN UserSkills s ON t.skill_required = s.skill
JOIN Users u ON s.user_id = u.user_id
LEFT JOIN UserTrainingProgress p 
  ON p.training_id = t.training_id AND p.user_id = u.user_id
WHERE u.user_id = 1;
use training_platform;
select * from trainings where skill_required like 'react';

SELECT t.*
FROM Trainings t
JOIN UserSkills us ON t.skill_required = us.skill
WHERE us.user_id = 1;