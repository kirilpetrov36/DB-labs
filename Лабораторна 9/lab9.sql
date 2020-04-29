use lab2;

/*
1 Скільки пар має кожен викладач
*/
select t.name, count(s.subject_id) as amount
from schedule s
inner join teachers t on s.teacher_id = t.id
group by teacher_id;

/*
2 Скільки в кожному місяці було зроблено записів до таблиці
*/
select year(created_at) as Year, monthname(created_at) as Month,
count(id) as amount
from schedule
group by Year, Month with rollup;

/*
3* Яку в середньому має пару викладач (її номер та дисперсія)
*/
select t.name , s.teacher_id, avg(s.number), var_pop(s.number) as Dispersion
from schedule s
inner join teachers t on s.teacher_id = t.id
group by(s.teacher_id);

/*
4 Кількість певної пари в тижні в 2019 році
*/
select c.subject_name as Subject, count(s.subject_id) as Amount
from schedule s
inner join curriculum c on s.subject_id = c.id
where year(created_at) = year(current_date)-1
group by subject_id
order by amount desc;
