use lab2;
drop table if exists lab2.schedule;
drop table if exists lab2.week_days;
drop table if exists lab2.curriculum;
drop table if exists lab2.teachers;
drop table if exists lab2.classrooms;
drop table if exists lab2.groupes;
drop table if exists lab2.cathedra;
drop table if exists lab2.buildings;
drop table if exists lab2.speciality;

create table lab2.week_days (
	id integer primary key auto_increment,
    week_day varchar(255) not null
);

create table lab2.speciality(
    id integer primary key auto_increment,
    name varchar(50) not null
);

create table lab2.curriculum(
	id integer primary key auto_increment,
    subject_name varchar(50) not null,
    speciality_id integer not null,
    teacher_id integer not null,
    year varchar(50) not null,
    type varchar(50) not null,
    constraint speciality_id foreign key (speciality_id) references lab2.speciality(id) on delete no action on update no action,
    constraint teacher_curr foreign key (teacher_id) references lab2.teachers(id) on delete no action on update no action
);

create table lab2.teachers(
	id integer primary key auto_increment,
    name varchar(50) not null,
    degree varchar(50),
    length_of_service integer not null,
    cathedra_id integer not null,
    constraint cathedra_teachers foreign key(cathedra_id) references lab2.cathedra(id) on delete no action on update no action
);

create table lab2.buildings(
	id integer primary key auto_increment,
    building_number integer not null,
    address varchar(255)
);

create table lab2.cathedra(
	id integer primary key auto_increment,
    cathedra_name varchar(50) not null,
    building_id integer not null,
    constraint building_id foreign key (building_id) references lab2.buildings(id) on delete no action on update no action
);

create table lab2.groupes(
	id integer primary key auto_increment,
	group_name varchar(10) not null,
    course integer not null,
    cathedra_id integer not null,
	students_amount integer not null,
    constraint cathedra_id foreign key(cathedra_id) references lab2.cathedra(id) on delete no action on update no action
);
 
create table lab2.classrooms(
	id integer primary key auto_increment,
    classroom_number varchar(10) not null,
    building_id integer not null,
    capacity integer not null,
    constraint building_id1 foreign key (building_id) references lab2.buildings(id) on delete no action on update no action
);

create table schedule ( 
	id int primary key auto_increment, 
	weekDay_id integer,
    number integer,
    subject_id integer,
    type integer,
    teacher_id integer,
    group_id integer,
    classroom_id integer,
    parity varchar(255) not null,
	constraint week_days foreign key (weekDay_id) references lab2.week_days(id) on delete no action on update no action,
    constraint subjects foreign key (subject_id) references lab2.curriculum(id) on delete no action on update no action,
    constraint teachers foreign key (teacher_id) references lab2.teachers(id) on delete no action on update no action,
    constraint groupes foreign key (group_id) references lab2.groupes(id) on delete no action on update no action,
    constraint classroom_id foreign key (classroom_id) references lab2.classrooms(id) on delete no action on update no action
);  
