USE employeeDatabase;

INSERT INTO department (name) VALUES
('Executive'),
('Office'),
('IT'),
('Field Staff');


INSERT INTO roles (title,salary,department_id) VALUES
('President & CEO', 150000.00,1),
('Vice-President & COO',100000,1),
('Accountanting Manager',70000,2),
('Accounting Asst',40000,2),
('HR Manager',65000,2),
('HR Asst',40000,2),
('IT Lead Manager', 75000,3),
('IT Support',55000,3),
('Paramedic Manager',55000,4),
('Paramedic',45000,4),
('EMT',29000,4);


INSERT INTO employee (first_name, last_name, role_id, manager_id)
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