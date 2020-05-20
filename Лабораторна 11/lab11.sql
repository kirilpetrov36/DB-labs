use lab2;

SELECT * FROM schedule;

START TRANSACTION;
	insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-208'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
    insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-209'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
    insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-210'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
    insert schedule (weekDay, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-211'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
COMMIT AND CHAIN;

START TRANSACTION;
	insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-208'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
    insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-209'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
    
    insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-210'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
SAVEPOINT firstPoint;
	insert schedule (weekDay_id, number, subject_id, type, teacher_id, group_id, classroom_id, parity)
    values ('Thursday', 1, (select id from curriculum where subject_name = 'Philosophy'), 'Lecture', (select id from teachers where name = 'Karivets I. V.'),
    (select id from groupes where group_name = 'KN-211'), (select id from classrooms where classroom_number = 117 AND building_id = 
    (select id from buildings where building_number = 1)), 'no_matter');
ROLLBACK TO firstPoint;
COMMIT;

SELECT * FROM schedule;



