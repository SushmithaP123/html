create table emp(
empno numeric,
empname varchar(10),
sal numeric check(sal>0),
designation varchar(10),
deptid numeric,
loc varchar(10),
constraint pk_empno primary key(empno),
constraint fk_deptid foreign key (deptid) references dept(deptid)
);
create table dept(
deptid numeric,
deptname varchar(10),
constraint pk_deptid primary key(deptid)
);

insert into emp(empno,empname,sal,designation,deptid,loc)
values(1,"prasad",1000,"manager",1,"bangalore");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(2,"krishna",2000,"dev",1,"hyderabad");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(3,"rakesh",3000,"manager",1,"chennai");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(4,"suresh",4000,"tester",2,"bangalore");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(5,"ramesh",5000,"dev",2,"pune");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(6,"harshitha",6000,"dev",2,"chennai");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(7,"darshan",7000,"tester",3,"hyderabad");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(8,"rajath",8000,"tester",3,"bangalore");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(9,"divya",9000,"manager",4,"chennai");

insert into emp(empno,empname,sal,designation,deptid,loc)
values(10,"chethan",10000,"dev",4,"pune");

insert into dept(deptid,deptname)
values(1,"finance");

insert into dept(deptid,deptname)
values(2,"reports");

insert into dept(deptid,deptname)
values(3,"facilities");

insert into dept(deptid,deptname)
values(4,"hr");

-- tables created
select * from emp;
select * from dept;

-- employess whose salary>1000
select empname,sal from emp
where sal>1000;

-- find max salary
select empname,max(sal) from emp;

-- select employee whose names end with 'd'
select empname from emp
where empname like "%d";

-- select employees from hr and finance
select empname,deptname from(select * from emp,dept where emp.deptid=dept.deptid)
where deptname="hr" or deptname="finance" ;

-- salary 
select empname,sal from emp
where sal between 2000 and 5000;

select empname,sal from emp
where sal>2000 and sal<5000;

-- no.of rows
select count(*) from emp;

-- sum of salary groupby dept
select deptname,sum(sal) from (select * from emp,dept where emp.deptid=dept.deptid)
group by deptname;

-- update

-- delete
delete from emp
where sal<5000;
select * from emp;
