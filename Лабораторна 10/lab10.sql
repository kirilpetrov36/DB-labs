use lab2;

drop procedure if exists getSubject;
DELIMITER //
CREATE PROCEDURE `getSubject` (IN groupe VARCHAR(10), IN subject VARCHAR(50), IN day VARCHAR(15))  
BEGIN  
    SELECT s.number, s.type, c.classroom_number, b.buildings
    FROM schedule s
    INNER JOIN classrooms c ON s.classroom_id = c.id
    INNER JOIN building b ON c.building_id = b.id
    WHERE s.group_id = (select id from groupes where group_name = groupe) AND
          s.subject_id = (select id from curriculum where subject_name = subject) AND
          s.number = (select id from week_days where week_day = day);
END //
DELIMITER ;

call getSubject('KN-210', 'Data Bases', 'Wednesday');
