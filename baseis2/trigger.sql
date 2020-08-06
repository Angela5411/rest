use final;

Drop trigger if exists insert_date ;
DELIMITER //
CREATE TRIGGER insert_date 
BEFORE INSERT ON quotes 
FOR EACH ROW
BEGIN
	IF NEW.q_date = '1/1/1' THEN 
		SET NEW.q_date = NOW();
	END IF;
END//
DELIMITER ;

#test this insert
insert into quotes values	(100,151036,"i don't wanna be the girl that has to fill the silence. The quiet scares me 'cause it screams the truth.",'1/1/1');
select * from quotes where s_no=151036;