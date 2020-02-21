
use final;
drop table if exists week_days;
create table week_days (
	id integer primary key auto_increment,
    week_day varchar(255) not null
);

drop table if exists lessons;
create table lessons(
	id integer primary key auto_increment,
    number integer not null
);

drop table if exists subjects;
create table subjects(
	id integer primary key auto_increment,
    subject varchar(50) not null
);

drop table if exists lesson_types;
create table lesson_types(
	id integer primary key auto_increment,
    type varchar(30) not null
);

drop table if exists teachers;
create table teachers(
	id integer primary key auto_increment,
    name varchar(50) not null
);

drop table if exists groupes;
create table groupes(
	id integer primary key auto_increment,
	groupe varchar(10) not null
);
 
 drop table if exists buildings;
 create table buildings(
	id integer primary key auto_increment,
    building_number integer not null
);

drop table if exists classrooms;
create table classrooms(
	id integer primary key auto_increment,
    classroom varchar(5) not null
);

drop table if exists week_parity;
create table week_parity(
	id integer primary key auto_increment,
    parity varchar(5) not null
);

drop table if exists start_time;
create table start_time(
	id integer primary key auto_increment,
    start time not null
);

drop table if exists end_time;
create table end_time(
	id integer primary key auto_increment,
    end time not null
);
drop table if exists schedule;
create table schedule ( 
	id int primary key auto_increment, 
	week_day integer,
    number integer,
    subject integer,
    type integer,
    teacher integer,
    groupe integer,
    building integer,
    classroom integer,
    parity integer,      
    start integer,
    end integer,
	foreign key (week_day) references week_days(id),
    foreign key (number) references lessons(id),
    foreign key (subject) references subjects(id),
    foreign key (type) references lesson_types(id),
    foreign key (teacher) references teachers (id),
    foreign key (groupe) references groupes(id),
    foreign key (building) references buildings(id),
    foreign key (classroom) references classrooms(id),
    foreign key (parity) references week_parity(id), 
	foreign key (start) references start_time(id),
	foreign key (end) references end_time(id)
    );  
