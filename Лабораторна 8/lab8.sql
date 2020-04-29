use lab2;
/* 
1) Виводимо subject_id, що в має полі type, назви які починаються на “Le”*/
select c.subject_name ,s.subject_id, s.type
from schedule s
inner join curriculum c on s.subject_id = c.id
where s.type LIKE 'LE%' order by subject_id ASC;
/*
2)Сортуємо викладачів по стажу роботи
*/
select name as Teacher, length_of_service as Year_experience, degree
from teachers 
order by length_of_service desc; 
/*
3) Запит де я хочу отримати id дисципліни, саму дисципліну
П. І. Б. викладача та в порядку хронологічному
*/
select w.week_day , c.subject_name as Subject, t.name as Teacher
from schedule s
inner join curriculum c on s.subject_id = c.id
inner join week_days w on s.weekDay_id = w.id 
inner join teachers t on c.teacher_id = t.id 
group by s.teacher_id 
order by weekDay_id limit 8;


select  c.classroom_number, count(s.classroom_id) as amount, w.week_day
from schedule s
inner join classrooms c on s.classroom_id = c.id
inner join week_days w on s.weekDay_id = w.id
group by(s.classroom_id)
having count(s.classroom_id)>2




