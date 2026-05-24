INSERT INTO products(pro_name, quantity) VALUES
    ('ip13', 7),
    ('ip14', 9),
    ('ip15', 15)
    
DELIMITER //
CREATE TRIGGER beforeProductDelete
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
  IF OLD.quantity > 10 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Không thể xóa sản phẩm với số lượng lớn hơn 10';
  END IF;
END //
DELIMITER ;

DELETE FROM products WHERE pro_name = 'ip13';

DELETE FROM products WHERE pro_name = 'ip15';