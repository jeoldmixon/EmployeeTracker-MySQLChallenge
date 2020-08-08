-- You may want to use a separate file containing functions for performing specific SQL queries you'll need to use. A constructor function or class could be helpful for organizing these. You may also want to include a seeds.sql file to pre-populate your database. This will make the development of individual features much easier.



-- _________________________________________________________________________________
-- CREATE TABLE department (id INT PRIMARY KEY, name VARCHAR(30));

INSERT INTO department (name) VALUES
('Executive'),
('Office'),
('IT'),
('Field Staff');
-- _________________________________________________________________________________
-- CREATE TABLE role (id INT PRIMARY KEY, title VARCHAR(30), salary DECIMAL, department_id INT);

INSERT INTO roles (title,salary,department_id) VALUES
('President & CEO', 150000.00,1),
('Vice-President & COO',100000,1),
('Accountanting Manager',70000,2),
('Accounting Asst',40000,2),
('HR Manager',65000,2),
('HR Asst',40000,2)
('IT Lead Manager', 75000,3),
('IT Support',55000,3),
('Paramedic Manager',55000,4),
('Paramedic',45000,4),
('EMT',29000,4);

-- 9 is PFS
-- _________________________________________________________________________________
-- CREATE TABLE employee (id INT PRIMARY KEY, first_name VARCHAR(30), last_name VARCHAR(30), role_id INT,
-- manager_id INT,);


INSERT INTO employee (first_name, last_name, roles_id, manager_id)
VALUES
  ('Ronald', 'Firbank', 1,null),
  ('Virginia', 'Woolf', 2,1),
  ('Piers', 'Gaveston', 3,2),
  ('Charles', 'LeRoi', 4,3),
  ('Katherine', 'Mansfield', 5,2),
  ('Dora', 'Carrington', 6,5),
  ('Edward', 'Bellamy', 7,2),
  ('Montague', 'Summers', 8,7),
  ('Octavia', 'Butler', 9,2),
  ('Unica', 'Zurn', 10,9),
  ('Justin','Smith',10,9),
  ('Jane','Smith',11,9),
  ('Charles','Sumner',11,9),
  ('Janie', 'Zurn', 10,9),
  ('Juan','Zuniga',10,9),
  ('Jose','Guerrero',11,9),
  ('Carlos','Zapata',11,9);