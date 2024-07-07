create table employee(
eno number,
ename varchar(20),
dep varchar(20),
desg varchar(20),
salary number
);

insert into employee values(1,'a','it','manager',155000);
insert into employee values(2,'b','product','manager',156000);
insert into employee values(3,'c','it','employee',157000);
insert into employee values(4,'d','sales','manager',158000);
insert into employee values(5,'e','it','jober',159000);


create or replace procedure dis
as
no number;
name varchar(20);
dept varchar(20);
desig varchar(20);
sal varchar(20);
begin
select eno,ename,dep,desg,salary into no,name,dept,desig,sal from employee 
where dep='it' and desg='manager';
dbms_output.put_line(no||' '||name||' '||dept||' '||desig||' '||sal);
end dis;


create or replace procedure del
as
begin
delete employee where dep='product';
dbms_output.put_line('deleted data :-');
end del;
/

create or replace function cou
return number
as
temp number(2) := 0;
begin
select count(*) into temp from employee;
return temp;
end min;
/

declare
c number(2);
begin
c := man();
dbms_output.put_line('min no :-'||c);
end;
/


create or replace function salman
return number
as
temp1 employee.salary%type;
begin
select AVG(salary) into temp1 from employee;
return temp1;
end salman;
/

declare 
a number;
begin
a := salman();
dbms_output.put_line('average salary is:-'||a);
end;
/

declare 
no number;
find_err exception;
begin
no :=&no;
if no < 15 then
raise find_err;
else
dbms_output.put_line(no);
end if;
exception
when find_err then
dbms_output.put_line('no is smaller than 15');
end;
/


create table employee(
eno number,
ename varchar(20),
dep varchar(20),
desg varchar(20),
salary number
);

declare
no employee.eno%type;
name employee.ename%type;
id number;
begin
id:=&id;
select ename into name from employee 
where 
id=no;
dbms_output.put_line(name);
exception
when no_data_found then
dbms_output.put_line('no such data');
when others then
dbms_output.put_line('error!');
end;
/


declare 
totalrow number(2);
begin
update employee set salary = salary + 5000;
if sql%notfound then
dbms_output.put_line('no employee updated');
elsif sql%found then totalrow := sql%rowcount;
dbms_output.put_line(totalrow || 'employee updated');
end if;
end;
/

create table cus(
id number,
name varchar(20)
);

insert into cus values(1,'abc');
insert into cus values(2,'cde');
insert into cus values(3,'efg');
insert into cus values(4,'ghi');
insert into cus values(5,'ijk');


declare
cid cus.id%type;
cname cus.name%type;
cursor ccus is
select id,name from cus;
begin
open ccus;
loop
fetch ccus into cid,cname;
exit when ccus%notfound;
dbms_output.put_line(cid||' '||cname);
end loop;
close ccus;
end;
/ 

create table stu(
id int,
name varchar(20)
);

create or replace package profun as
procedure insdis(id int, name varchar(20));
end profun;
/

create or replace package body profun as
procedure insdis(id int, name varchar(20)) 
is 
begin
insert into stu values(id,name);
dbms_output.put_line('inserted');
end insdis;
end profun;
/

declare
id int;
name varchar(20);
begin
id :=&id;
name :=&name;
profun.insdis(id,name);
end;
/

create or replace package upd45 as
procedure updt;
end upd45;
/

create or replace package body upd45 as
procedure updt is
begin
update employee set salary = (salary + 5000);
dbms_output.put_line('updated');
end updt;
end upd45;
/

begin
upd45.updt();
end;
/

create table mar(
id int,
name varchar2(20),
salary int
);

create or replace package insda as
procedure insdata(id int, name varchar2, salary int);
end insda;
/

create or replace package body insda as
procedure insdata(id int, name varchar2, salary int) is
begin
insert into mar values(id,name,salary);
end insdata;
end insda;
/

declare
id int;
name varchar2(20);
salary int;
begin
id:=&id;
name:=&name;
salary:=&salary;
insda.insdata(id,name,salary);
end;
/


create table employeee(id number(5), name varchar2(20), age number(5), address varchar(20), salary
number(10));


BEGIN
INSERT INTO EMPLOYEEE VALUES (1, 'Ramesh', 23, 'Ahmedabad', 2000);
INSERT INTO EMPLOYEEE VALUES (2, 'Khilan', 22, 'Delhi', 1500);
INSERT INTO EMPLOYEEE VALUES (3, 'Kaushik', 24, 'Kota', 2000);
INSERT INTO EMPLOYEEE VALUES (4, 'Chaitali', 25, 'Mumbai', 6500);
INSERT INTO EMPLOYEEE VALUES (5, 'Hardik', 21, 'Bhopal', 8500);
INSERT INTO EMPLOYEEE VALUES (6, 'Sunita', 20, 'MP', 4500);
END;
/

CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON employeee
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
sal_diff number;
BEGIN
sal_diff := :NEW.salary - :OLD.salary;
dbms_output.put_line('Old salary: ' || :OLD.salary);
dbms_output.put_line('New salary: ' || :NEW.salary);
dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/


create table emp(
eno number,
ename varchar2(20),
dep varchar2(20),
salary number
);

begin
insert into emp values(1,'d','it',152643);
insert into emp values(2,'c','sale',152843);
insert into emp values(3,'a','manager',152743);
insert into emp values(4,'e','bac',152943);
insert into emp values(5,'b','hfj',150643);
end;
/

create or replace trigger empdel 
before delete on emp
for each row
begin
insert into empdel values(:old.eno, :old.ename, :old.dep, :old.salary, sysdate);
end;
/

create or replace trigger upemp
before update on emp
for each row
declare 
dsal int;
begin
dsal := :new.salary - :old.salary;
dbms_output.put_line('diffrence '||dsal);
end;
/

update emp set salary=155555 where eno=1;

create or replace trigger upsaltrg
before update on emp
for each row
begin
insert into new_emp values(:old.eno, :old.salary, :new.salary);
end;
/

create table impins(
eno number,
dep varchar2(20),
salary number
);

CREATE OR REPLACE TRIGGER insnewdata
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
insert into impins values(:new.eno, :new.dep, :new.salary);
end;
/

insert into emp values(7,'gf','finance',500000);

select * from impins;


create table new_em(
eno number,
oldsalary number,
newsalary number
);

create or replace trigger upsaltrg
before update on emp
for each row
begin
insert into new_em values(:old.eno, :old.salary, :new.salary);
end;
/

begin
update emp set salary=55555 where eno=2;
end;
/
