-- mySQL -u justin -p
-- source db/schema.sql
-- source db/seeds.sql
DROP DATABASE IF EXISTS employeeDatabase;
CREATE DATABASE employeeDatabase;
USE employeeDatabase;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS  employee;


CREATE TABLE department (
  id INTEGER AUTO_INCREMENT, 
  name VARCHAR(30),
  PRIMARY KEY (id)
  );


CREATE TABLE roles (
  id INTEGER AUTO_INCREMENT NOT NULL,
  title VARCHAR(30),
  salary DECIMAL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES department(id),
  PRIMARY KEY (id)
);


CREATE TABLE employee (
  id INTEGER AUTO_INCREMENT ,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INT,
  manager_id INT,
  CONSTRAINT fk_roles FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE SET NULL,
  PRIMARY KEY (id)
);