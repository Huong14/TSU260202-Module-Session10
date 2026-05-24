CREATE TABLE employees(
    em_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE salary_log(
	log_id INT PRIMARY KEY AUTO_INCREMENT,
    em_id INT NOT NULL,
    old_salary DECIMAL(10,2) NOT NULL,
    new_salary DECIMAL(10,2) NOT NULL,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (em_id) REFERENCES employees(em_id)
);

INSERT INTO employees (first_name,last_name,salary,email,phone) VALUES
    ('Tran','A',7000000,'a@gmail.com',1234567890),
    ('Nguyen','B',8000000,'b@gmail.com',1234567891),
    ('Tran','C',9000000,'c@gmail.com',1234567892),
    ('Hua','D',10000000,'d@gmail.com',1234567893),
    ('Nguyen','E',11000000,'e@gmail.com',1234567894),
    ('Nguyen','F',12000000,'f@gmail.com',1234567895),
    ('Tran','G',13000000,'g@gmail.com',1234567896),
    ('Bui','H',14000000,'h@gmail.com',1234567897),
    ('Tong','I',15000000,'i@gmail.com',1234567899),
    ('Pham','L',16000000,'l@gmail.com',1234567810)

DELIMITER //
CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO salary_log(em_id,old_salary,new_salary)
  VALUES(OLD.em_id,OLD.salary,NEW.salary);
END //
DELIMITER ;

UPDATE employees SET salary = 10000000 WHERE em_id = 1;

SELECT * FROM salary_log;
