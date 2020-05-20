use lab2;
DROP TRIGGER IF EXISTS building_delete;
DROP TRIGGER if exists schedule_subject;
DROP TRIGGER if exists schedule_dates;

/*1) Перед видаленням з таблиці корпусів один з корпусів в таблиці
аудиторій це значення видаляється першим */


/*SELECT * FROM classrooms;
SELECT * FROM buildings;
DROP TRIGGER IF EXISTS building_delete;
DELIMITER //
CREATE TRIGGER building_delete BEFORE DELETE ON buildings 
FOR EACH ROW BEGIN
	DELETE FROM classrooms where building_id = OLD.id;
	END //
DELIMITER ;

DELETE FROM buildings where id = 11;
SELECT * FROM classrooms;
SELECT * FROM buildings;
*/

/* 2) Коли додаєш нові дані і замість дня тижня пишеш його число, додається не число, а день тижня */
/*
DROP TRIGGER if exists schedule_subject;
DELIMITER //
CREATE TRIGGER schedule_subject 
	BEFORE INSERT 
    ON schedule 
	FOR EACH ROW BEGIN
			SET NEW.weekDay_id = (select week_day from week_days where id = NEW.weekDay_id);
	END //
DELIMITER ;
select * from schedule;

insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values (4, 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-208'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
select * from schedule;
*/

/*3) Коли до таблиці schedule додається новий запис,
тригер додає до таблиці time id запису та час додання*/

/*
drop table if exists time;
create table time (
	id int primary key not null,
    time date not null,
    foreign key (id) references schedule(id)
);

DROP TRIGGER if exists schedule_dates;
DELIMITER //
CREATE TRIGGER schedule_dates
	AFTER INSERT
    ON schedule 
	FOR EACH ROW BEGIN
			INSERT time (id, time) values(NEW.id, NOW());
	END //
DELIMITER ;

insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values (4, 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-208'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
select * from time;
select * from schedule;
*/

DROP FUNCTION  if exists checkAmount;
DELIMITER //
CREATE FUNCTION checkAmount (capacity INT, amount INT)
RETURNS INT
deterministic
BEGIN
	IF (capacity < amount) THEN
		return 0;
	else
		return 1;
	END IF;
   
END//
DELIMITER ;

DROP TRIGGER if exists check_capacity;
DELIMITER //
CREATE TRIGGER check_capacity
	BEFORE INSERT
    ON schedule 
	FOR EACH ROW BEGIN
            IF checkAmount((Select capacity from classrooms where id = NEW.classroom_id), (select students_amount from groupes where id = NEW.group_id)) = 0 THEN
				signal sqlstate '45000'
				SET MESSAGE_TEXT = "Not enough space in classroom";
			END IF;
	END //
DELIMITER ;

insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values (4, 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-208'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
