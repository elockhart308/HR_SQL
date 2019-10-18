CREATE DATABASE hr;
USE hr;

CREATE TABLE person (
  person_id INT(8) NOT NULL auto_increment,
  first_name VARCHAR(25) default NULL,
  last_name VARCHAR(25) default NULL,
  gender VARCHAR(1) default NULL,
  age INT(8) default NULL,
  years_in_company INT(4) NOT NULL,
  PRIMARY KEY (person_id)
) AUTO_INCREMENT=1;

CREATE TABLE department (
  dept_id INT(8) NOT NULL auto_increment,
  dept_name VARCHAR(25) default NULL,
  building VARCHAR(25) default NULL,
  PRIMARY KEY (dept_id)
) AUTO_INCREMENT=1;

CREATE TABLE person_department (
  person_id INT(8) NOT NULL,
  dept_id INT(8)NOT NULL,
  PRIMARY KEY (person_id, dept_id) 
)

INSERT INTO hr.person (first_name, last_name, gender, age, years_in_company)
	VALUES ('Julio', 'Jackson', 'M', 31, 5),
           ('Jessica', 'Lopez', 'F', 57, 10),
           ('Robert', 'Rosa', 'M', 25, 3),
           ('Amanda', 'Bellapianta', 'F', 46, 15);

INSERT INTO hr.department (dept_name, building)
	VALUES ('Engineering', 'Building 5'),
           ('Education', 'Building 2'),
           ('Human Resources', 'Building 6'),
           ('Science', 'Building 1');
           
INSERT INTO hr.person_department (person_id, dept_id)
	VALUES (1, 1);

INSERT INTO hr.person_department (person_id, dept_id)
  SELECT  (SELECT person_id FROM hr.person WHERE UPPER(first_name) = 'JULIO' AND UPPER(last_name) = 'JACKSON'),
           (SELECT dept_id FROM hr.department WHERE UPPER(dept_name) = 'ENGINEERING');
           
           
INSERT INTO hr.person_department (person_id, dept_id)
  SELECT  (SELECT person_id FROM hr.person WHERE UPPER(first_name) = 'JESSICA' AND UPPER(last_name) = 'LOPEZ'),
           (SELECT dept_id FROM hr.department WHERE UPPER(dept_name) = 'SCIENCE');
            
SELECT person.first_name, person.last_name, department.dept_name
FROM person
FULL OUTER JOIN department ON person.person_id=department.dept_id
ORDER BY person.last_name;
