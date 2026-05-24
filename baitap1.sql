CREATE DATABASE session10;
USE session10;

CREATE TABLE products(
     pro_id INT PRIMARY KEY AUTO_INCREMENT,
     pro_name VARCHAR(100) NOT NULL,
     quantity INT NOT NULL
);

CREATE TABLE inventoryChanges(
     change_id INT PRIMARY KEY AUTO_INCREMENT,
     pro_id INT NOT NULL,
     old_quantity INT NOT NULL,
     new_quantity INT NOT NULL,
     change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY(pro_id) REFERENCES products (pro_id)
);

DELIMITER //
CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
  	INSERT INTO inventorychanges(pro_id, old_quantity, new_quantity)
    VALUES(NEW.pro_id, OLD.quantity, NEW.quantity);
END //
DELIMITER ;

INSERT INTO products(pro_name,quantity) VALUES
     ('ip7',10),
     ('ip11',7),
     ('ip12',300);
     
UPDATE products SET quantity = 12 WHERE pro_name = 'ip7';

UPDATE products SET quantity = 15 WHERE pro_name = 'ip11';

SELECT * FROM inventorychanges;
     