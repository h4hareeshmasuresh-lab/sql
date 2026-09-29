create database school;
create table course
(courseid int primary key,
course_name varchar(100),
instructor varchar(100));
create table student(
student_id int primary key,
name varchar(100),
courseid int,
foreign KEY(courseid) REFERENCES "course"(courseid));
select*from course;
select*from student;
insert into course (courseid,course_name,instructor)
values(101,'pb','suresh'),(102,'wd','priya'),(103,'ds','arun'),(104,'ai','lekha');
insert into student(student_id,name,courseid)
values(1,'anjali',101),(2,'rahul',102),(3,'neha',103),(4,'arjun',104),(5,'diya',null);

select*from student s inner join course c ON s.courseid = c.courseid;
select s.student_id,s.name,c.course_name from student s LEFT join course c ON s.courseid = c.courseid;
select s.student_id,s.name,c.course_name from student s RIGHT join course c ON s.courseid = c.courseid;
select s.student_id,s.name,c.course_name from student s FULL join course c ON s.courseid = c.courseid;
select * from student s CROSS join course c ;
