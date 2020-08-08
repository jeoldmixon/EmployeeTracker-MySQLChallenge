DROP TABLE IF EXISTS department
DROP TABLE IF EXISTS roles
DROP TABLE IF EXISTS  employee

-- Department
-- id: INT PRIMARY KEY
-- name: VARCHAR(30) to hold department name

CREATE TABLE department (
  id INTEGER AUTO_INCREMENT NOT NULL, 
  name VARCHAR(30),
  PRIMARY KEY (id)
);

-- Role
-- id: INT PRIMARY KEY
-- title: VARCHAR(30) to hold role title
-- salary: DECIMAL to hold role salary
-- department_id: INT to hold reference to department role belongs to

CREATE TABLE roles (
  id INTEGER AUTO_INCREMENT NOT NULL,
  title VARCHAR(30),
  salary DECIMAL,
  department_id INT,
  PRIMARY KEY (id)
);

-- Employee
-- id: INT PRIMARY KEY
-- first_name: VARCHAR(30) to hold employee first name
-- last_name: VARCHAR(30) to hold employee last name
-- role_id: INT to hold reference to employee role
-- manager_id: INT to hold reference to another employee that is manager of the current employee. This field may be null if the employee has no manager.

CREATE TABLE employee (
  id INTEGER AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INT,
  manager_id INT,
  PRIMARY KEY (id)
);