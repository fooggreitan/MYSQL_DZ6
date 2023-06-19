USE lesson_6;

-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS time_sec;

DELIMITER //

CREATE FUNCTION time_sec(val INT)
RETURNS TEXT DETERMINISTIC
BEGIN 
  SET @x = CONCAT(
	  FLOOR(val / (24 * 3600)), ' days ', 
	  FLOOR((val % (24 * 3600))/3600), ' hours ', 
	  FLOOR((val%3600)/60), ' minutes ', 
	  FLOOR(val%60), ' seconds '
  );
  RETURN @x;
END //

DELIMITER ;

SET @y = 123456;
SELECT time_sec(@y) AS 'TIME';

-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DROP PROCEDURE IF EXISTS far;

DELIMITER //

CREATE PROCEDURE far (val INT)
BEGIN
  DECLARE i INT DEFAULT 1;
  
  WHILE i <= val DO
    IF i%2 = 0 THEN
	  SELECT i AS res;
    END IF;
    SET i = i + 1;
  END WHILE;
END//

DELIMITER ;

SET @num = 10;
CALL far(@num);

-- Данная промежуточная аттестация оценивается по системе "зачет" / "не зачет" "Зачет" ставится, если слушатель 
-- успешно выполнил 1 или 2 задачи "Незачет" ставится, если слушатель успешно выполнил 
-- 0 задач Критерии оценивания: 1 - слушатель верно создал функцию, 
-- которая принимает кол-во сек и формат их в кол-во дней часов. 2 - слушатель выведили только четные числа от 1 до 10.