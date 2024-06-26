// create table student name with appropriate field

create table student(
roll_no int PRIMARY KEY,
name varchar(20) NOT NULL,
age int NOT NULL,
mobile_no varchar(10) UNIQUE
);

// Enter data in a student table

insert into student values(1,'ahad',20,'1256348970');
insert into student values(2,'saad',24,'1524878932');
insert into student values(3,'aman',23,'0000152463');
insert into student values(4,'varun',22,'1452870000');
insert into student values(5,'jaydeep',21,'1698523470');

//update query set new mobie number where naem is ahad

update student set mobile_no='2222222222' where name='ahad';

// delete data in student table where name is saad

delete from student where name='saad';


//Table related queries

// Alter (to change the schema)

// add column

alter table student ADD column blood_group varchar(10) NOT NULL;

// drop column

alter table student drop column blood_group;

// rename table

alter table student rename to students;

//chnage column name (rename)

alter table students change column name f_name varchar(20) NOT NULL;

// modify column (data type and constraint change)

alter table students modify age varchar(3) NOT NULL;

// truncate to delete data

truncate table  students;




// create table salary name with appropriate field

create table salary(
name varchar(20) NOT NULL,
salary int NOT NULL
);

// Enter data in a salary table

insert into salary values('ahad',150000);
insert into salary values('jaydeep',160000);
insert into salary values('aman',170000);
insert into salary values('salman',180000);
insert into salary values('varun',190000);

// between operator to find a salary between 2 number of salary 

select * from salary where salary between 160000 and 180000;

// in operator to find a data is available or not in a table

select * from salary where name in ('jaydeep');

// this clause sets an upper limit on nummber of rows to be returned
select * from salary limit 3;

//Aggregation function

//count return a total  number of data in the table.

select count(*) from salary;

//max return a maximum data

select max(salary) from salary;

// minn return a minimum data in the table

select min(salary) from salary;

// sum return a total content given field

select sum(salary) as total_salary from salary;

// avg return a average data in the given field

select avg(salary) as avg_salary from salary;



//ORDER BBY CLAUSE

// This clause is used to sort the data

//ascending order 

select * from salary order by salary asc;

//descending order

select * from salary order by salary desc;