DELIMITER //
  CREATE TRIGGER beforeInsertProducct
  BEFORE INSERT ON products
  FOR EACH ROW
  BEGIN
     IF NEW.quantity < 0
     THEN SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Không thể thêm sản phẩm mới khi số lượng nhỏ hơn 0';
     END IF;
END //
DELIMITER ;

INSERT INTO products(pro_name,quantity) VALUE('ip17', -3);