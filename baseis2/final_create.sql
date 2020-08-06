
DROP DATABASE final;
CREATE DATABASE final;
USE final;

create table school(institution varchar(100),facultry varchar(100),department varchar(100),sch_no int (6)not null,
primary key(sch_no));

create table student(s_no int(6)not null,`password` varchar(30)not null,surname varchar(14),`name` varchar(14),cv TEXT, birthdate date,sch_no int (6) not null,
primary key(s_no),foreign key (sch_no) references school(sch_no));

create table photos(s_no int(6)not null,p_no int(6)not null,photo varchar(250) default ".\\picture\\default.jpg",
primary key(s_no,p_no),foreign key(s_no) references student(s_no));

create table videos(s_no int(6) not null, v_no int(6)not null, video varchar(100)  default "https://www.youtube.com/embed/u9Dg-g7t2l4",
primary key(s_no,v_no) ,foreign key(s_no) references student(s_no));




create table quotes(q_no int(6)not null,s_no int(6)not null,quote TEXT not null,q_date date, 
primary key (q_no,s_no),foreign key (s_no) references student(s_no));



create table languages(s_no int(6)not null,`language` varchar(14)not null,level  ENUM ("elementary", "intermediate", "advanced","proficient"),
primary key(s_no,`language`),foreign key (s_no) references student(s_no));



create table interest(i_no int(6)not null,interest varchar(30)not null,
primary key (i_no));

create table interests(s_no int(6)not null,i_no int (6)not null,
primary key (s_no,i_no),foreign key (s_no) references student(s_no),foreign key (i_no) references interest(i_no));



create table hobby (h_no int(6)not null,hobby varchar(14)not null,primary key (h_no));

create table hobbies(s_no int(6)not null,h_no int(6)not null,
primary key(s_no,h_no),foreign key (s_no) references student(s_no),foreign key (h_no) references hobby(h_no));
