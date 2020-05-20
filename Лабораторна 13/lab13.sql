use lab2;
drop index week_day_id on week_days;
drop index teacher_name on teachers;

show index from schedule;
show index from teachers;

explain select w.week_day, s.number, c.subject_name, t.name, g.id
from schedule s
inner join week_days w on s.weekDay_id = w.id
inner join curriculum c on s.subject_id = c.id
inner join teachers t on s.teacher_id = t.id
inner join groupes g on s.group_id = g.id
where t.length_of_service > 7;

drop index week_day_id on week_days;
create unique index week_day_id on week_days(id);

explain select w.week_day, s.number, c.subject_name, t.name, g.id
from schedule s
inner join week_days w on s.weekDay_id = w.id
inner join curriculum c on s.subject_id = c.id
inner join teachers t on s.teacher_id = t.id
inner join groupes g on s.group_id = g.id
where t.length_of_service > 7;

explain select name, length_of_service from teachers where length_of_service = 11 and name = 'Melnykova N. I.';
create index teacher_names on teachers(name, length_of_service);
explain select name, length_of_service from teachers where length_of_service = 11 and name = 'Melnykova N. I.';

