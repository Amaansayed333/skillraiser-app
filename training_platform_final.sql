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


INSERT INTO Trainings (title, category, duration_minutes, skill_required, date_created) VALUES
('React Basics', 'Frontend', 120, 'React', '2024-04-01'),
('Advanced CSS', 'Frontend', 100, 'CSS', '2024-03-25'),
('JavaScript ES6', 'Frontend', 90, 'JavaScript', '2024-03-20'),
('SQL for Beginners', 'Data', 80, 'SQL', '2024-04-02'),
('Python for Data', 'Data', 100, 'Python', '2024-04-04'),
('Node.js Crash Course', 'Backend', 120, 'Node.js', '2024-04-05'),
('AWS Fundamentals', 'Cloud', 110, 'AWS', '2024-03-22'),
('Docker Mastery', 'DevOps', 90, 'Docker', '2024-03-18'),
('Flutter Essentials', 'Mobile', 95, 'Flutter', '2024-04-06'),
('TensorFlow Intro', 'ML', 105, 'TensorFlow', '2024-03-28'),
('Figma Design', 'Design', 60, 'Figma', '2024-03-30'),
('Selenium Automation', 'QA', 70, 'Selenium', '2024-04-01'),
('Power BI Visuals', 'Analytics', 85, 'Power BI', '2024-03-29'),
('Deep Learning Basics', 'AI', 130, 'Deep Learning', '2024-04-08'),
('React Advanced', 'Frontend', 100, 'React', '2024-04-10'),
('Modern CSS Layouts', 'Frontend', 80, 'CSS', '2024-04-09'),
('Async JS Deep Dive', 'Frontend', 90, 'JavaScript', '2024-04-09'),
('SQL Joins Mastery', 'Data', 85, 'SQL', '2024-04-07'),
('Python OOP Concepts', 'Programming', 95, 'Python', '2024-04-08'),
('Advanced Node.js', 'Backend', 120, 'Node.js', '2024-04-09'),
('AWS Deployment', 'Cloud', 110, 'AWS', '2024-04-11'),
('Docker & CI/CD', 'DevOps', 100, 'Docker', '2024-04-10'),
('Flutter UI Tricks', 'Mobile', 75, 'Flutter', '2024-04-10'),
('TensorFlow Projects', 'ML', 120, 'TensorFlow', '2024-04-11'),
('Figma Pro Tips', 'Design', 65, 'Figma', '2024-04-08'),
('Selenium with Java', 'QA', 85, 'Selenium', '2024-04-08'),
('Power BI Dashboards', 'Analytics', 90, 'Power BI', '2024-04-07'),
('Deep Learning with PyTorch', 'AI', 125, 'Deep Learning', '2024-04-12'),
('JavaScript ES6 Mastery', 'Frontend', 90, 'JavaScript', '2024-04-11'),
('Async JS & Promises', 'Frontend', 80, 'JavaScript', '2024-04-10'),
('React with Hooks', 'Frontend', 100, 'React', '2024-04-10'),
('Node.js Fundamentals', 'Backend', 90, 'Node.js', '2024-04-08'),
('Node.js with Express', 'Backend', 110, 'Node.js', '2024-04-09'),
('Intro to Python', 'Programming', 85, 'Python', '2024-04-07'),
('Python for Data Science', 'Data', 95, 'Python', '2024-04-09'),
('SQL Basics', 'Data', 75, 'SQL', '2024-04-08'),
('Advanced SQL Queries', 'Data', 95, 'SQL', '2024-04-10'),
('AWS Fundamentals', 'Cloud', 100, 'AWS', '2024-04-07'),
('Deploying Apps on AWS', 'Cloud', 120, 'AWS', '2024-04-09'),
('CSS Flexbox & Grid', 'Frontend', 60, 'CSS', '2024-04-10'),
('Responsive Design with CSS', 'Frontend', 70, 'CSS', '2024-04-11'),
('Java Basics', 'Programming', 90, 'Java', '2024-04-08'),
('Java OOP & Collections', 'Programming', 100, 'Java', '2024-04-10'),
('Flutter Basics', 'Mobile', 85, 'Flutter', '2024-04-09'),
('Building UI in Flutter', 'Mobile', 100, 'Flutter', '2024-04-11'),
('Docker Fundamentals', 'DevOps', 90, 'Docker', '2024-04-07'),
('Docker Compose & CI/CD', 'DevOps', 105, 'Docker', '2024-04-09'),
('Figma for Beginners', 'Design', 75, 'Figma', '2024-04-07'),
('Prototyping with Figma', 'Design', 85, 'Figma', '2024-04-09');


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
select * from userskills;

use training_platform;



ALTER TABLE Trainings
ADD COLUMN description VARCHAR(255);

select * from trainings;

SELECT t.*
FROM Trainings t
JOIN UserSkills us ON t.skill_required = us.skill
WHERE us.user_id = 1;

UPDATE Trainings
SET description = 'Learn the fundamentals of React including components and state.'
WHERE title = 'React Basics';

UPDATE Trainings
SET description = 'Master CSS concepts like transitions, animations, and responsive design.'
WHERE title = 'Advanced CSS';

UPDATE Trainings
SET description = 'Explore advanced React topics like hooks, context API, and performance.'
WHERE title = 'React Advanced';

UPDATE Trainings
SET description = 'Learn modern layout techniques including Flexbox and Grid.'
WHERE title = 'Modern CSS Layouts';

UPDATE Trainings
SET description = 'Dive into React hooks like useState, useEffect, and custom hooks.'
WHERE title = 'React with Hooks';

UPDATE Trainings
SET description = 'Understand how Flexbox and CSS Grid work together for layouts.'
WHERE title = 'CSS Flexbox & Grid';

UPDATE Trainings
SET description = 'Cover JS basics like variables, functions, loops, and DOM manipulation.'
WHERE title = 'JavaScript Essentials';

UPDATE Trainings
SET description = 'Get started with TypeScript and learn about types and interfaces.'
WHERE title = 'TypeScript for Beginners';

UPDATE Trainings
SET description = 'Master interacting with the DOM using JavaScript.'
WHERE title = 'JavaScript DOM Mastery';

UPDATE Trainings
SET description = 'Build websites that look great on all devices using responsive techniques.'
WHERE title = 'Responsive Design Fundamentals';

UPDATE Trainings
SET description = 'Understand the ES6 features of JavaScript like arrow functions, promises, and classes.'
WHERE title = 'JavaScript ES6';

UPDATE Trainings
SET description = 'Learn the fundamentals of SQL for querying and managing relational databases.'
WHERE title = 'SQL for Beginners';

UPDATE Trainings
SET description = 'Use Python for data analysis, manipulation, and basic visualization techniques.'
WHERE title = 'Python for Data';

UPDATE Trainings
SET description = 'Kickstart your backend development journey with Node.js and build scalable apps.'
WHERE title = 'Node.js Crash Course';

UPDATE Trainings
SET description = 'Explore core AWS services and gain foundational cloud computing knowledge.'
WHERE title = 'AWS Fundamentals';

UPDATE Trainings
SET description = 'Master Docker containers, images, and deployment strategies for DevOps.'
WHERE title = 'Docker Mastery';

UPDATE Trainings
SET description = 'Build beautiful cross-platform apps with Google’s Flutter framework.'
WHERE title = 'Flutter Essentials';

UPDATE Trainings
SET description = 'Get introduced to TensorFlow and learn how to build simple ML models.'
WHERE title = 'TensorFlow Intro';

UPDATE Trainings
SET description = 'Design stunning user interfaces using Figma’s collaborative design features.'
WHERE title = 'Figma Design';

UPDATE Trainings
SET description = 'Automate web testing using Selenium and write powerful test scripts.'
WHERE title = 'Selenium Automation';

UPDATE Trainings
SET description = 'Create interactive and insightful dashboards using Power BI visuals.'
WHERE title = 'Power BI Visuals';

UPDATE Trainings
SET description = 'Understand the basics of deep learning and build simple neural networks.'
WHERE title = 'Deep Learning Basics';

UPDATE Trainings
SET description = 'Deepen your Python skills with advanced OOP concepts and best practices.'
WHERE title = 'Python OOP Concepts';

UPDATE Trainings
SET description = 'Level up your backend skills with advanced Node.js topics and patterns.'
WHERE title = 'Advanced Node.js';

UPDATE Trainings
SET description = 'Learn to deploy scalable apps on AWS using core services and best practices.'
WHERE title = 'AWS Deployment';

UPDATE Trainings
SET description = 'Master Docker and CI/CD pipelines to automate and streamline DevOps workflows.'
WHERE title = 'Docker & CI/CD';

UPDATE Trainings
SET description = 'Enhance your Flutter apps with advanced UI design and animation techniques.'
WHERE title = 'Flutter UI Tricks';

UPDATE Trainings
SET description = 'Build real-world projects using TensorFlow for advanced machine learning tasks.'
WHERE title = 'TensorFlow Projects';

UPDATE Trainings
SET description = 'Boost your design workflow with advanced Figma tips, tricks, and components.'
WHERE title = 'Figma Pro Tips';

UPDATE Trainings
SET description = 'Automate testing using Selenium with Java for robust quality assurance.'
WHERE title = 'Selenium with Java';

UPDATE Trainings
SET description = 'Design compelling dashboards using Power BI for data-driven decision making.'
WHERE title = 'Power BI Dashboards';

UPDATE Trainings
SET description = 'Explore deep learning with Python and build advanced neural network models.'
WHERE title = 'Deep Learning with Python';

UPDATE Trainings
SET description = 'Master modern JavaScript with advanced ES6 techniques and best practices.'
WHERE title = 'JavaScript ES6 Mastery';

UPDATE Trainings
SET description = 'Understand and implement asynchronous JavaScript using promises and async/await.'
WHERE title = 'Async JS & Promises';

UPDATE Trainings
SET description = 'Understand Node.js fundamentals and its asynchronous architecture.'
WHERE title = 'Node.js Fundamentals';

UPDATE Trainings
SET description = 'Build powerful backend applications using Node.js and Express framework.'
WHERE title = 'Node.js with Express';

UPDATE Trainings
SET description = 'A hands-on introduction to Python programming basics and core syntax.'
WHERE title = 'Intro to Python';

UPDATE Trainings
SET description = 'Apply Python in data science using libraries like Pandas and Matplotlib.'
WHERE title = 'Python for Data Science';

UPDATE Trainings
SET description = 'Learn SQL basics for querying and managing relational databases.'
WHERE title = 'SQL Basics';

UPDATE Trainings
SET description = 'Write complex queries using joins, subqueries, and window functions in SQL.'
WHERE title = 'Advanced SQL Queries';

UPDATE Trainings
SET description = 'Learn to deploy full-stack applications on AWS using best practices.'
WHERE title = 'Deploying Apps on AWS';

UPDATE Trainings
SET description = 'Build responsive web pages using CSS techniques and layout strategies.'
WHERE title = 'Responsive Design with CSS';

UPDATE Trainings
SET description = 'Understand Java fundamentals and core programming concepts.'
WHERE title = 'Java Basics';

UPDATE Trainings
SET description = 'Master OOP and collections framework in Java for software development.'
WHERE title = 'Java OOP & Collections';

UPDATE Trainings
SET description = 'Build beautiful and functional apps with Flutter UI basics.'
WHERE title = 'Flutter Basics';

UPDATE Trainings
SET description = 'Create real-world mobile apps with Flutter from start to deployment.'
WHERE title = 'Building UI in Flutter';

UPDATE Trainings
SET description = 'Understand Docker architecture and container orchestration fundamentals.'
WHERE title = 'Docker Fundamentals';

UPDATE Trainings
SET description = 'Dive deep into asynchronous JavaScript, covering promises, async/await, and event loops.'
WHERE title = 'Async JS Deep Dive';

UPDATE Trainings
SET description = 'Master SQL joins including inner, outer, left, right, and self joins with real-world examples.'
WHERE title = 'SQL Joins Mastery';

UPDATE Trainings
SET description = 'Implement deep learning models using PyTorch and understand neural network internals.'
WHERE title = 'Deep Learning with PyTorch';

UPDATE Trainings
SET description = 'Learn how to use Docker Compose and CI/CD tools to manage multi-container applications.'
WHERE title = 'Docker Compose & CI/CD';

UPDATE Trainings
SET description = 'Begin your journey into design with Figma’s intuitive tools and collaborative features.'
WHERE title = 'Figma for Beginners';

UPDATE Trainings
SET description = 'Learn how to create interactive prototypes in Figma for seamless UX design workflows.'
WHERE title = 'Prototyping with Figma';

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




