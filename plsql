drop table trainee;
create table trainee(
    rollno numeric,
    fname varchar(20),
    lname varchar(20)
);
insert into trainee(rollno,fname,lname)
values(1,'deepa','prakash');
insert into trainee(rollno,fname,lname)
values(123,'sush','p');
insert into trainee(rollno,fname,lname)
values(122,'xxx','yyy');
insert into trainee(rollno,fname,lname)
values(125,'prajwal','manj');
insert into trainee(rollno,fname,lname)
values(126,'prathik','deep');
select * from trainee;

declare
c_id trainee.rollno%type:=123;
c_fname trainee.fname%type;
c_lname trainee.lname%type;
begin
select rollno,fname,lname into c_id,c_fname,c_lname from trainee where rollno=c_id;
dbms_output.put_line('trainee'||' '||c_fname);
end;
/

declare
total_rows number;
begin
update trainee set fname ='mang'where rollno=122;
if sql%notfound then
dbms_output.put_line('not found');
elsif sql%found then
total_rows:=sql%rowcount;
dbms_output.put_line(total_rows || 'affected');
end if;
end;
/

DECLARE  
   c_id trainee.rollno%type;
   c_fname trainee.fname%type;
   c_lname trainee.lname%type;
   cursor c_trainee is select rollno,fname,lname from trainee;
begin
 open c_trainee;
 loop
 fetch c_trainee into c_id,c_fname,c_lname;
 exit when c_trainee%notfound;
 dbms_output.put_line(c_id||' '||c_fname||' '||c_lname);
 end loop;
 close c_trainee;
 end;
 /
 declare
   c_id trainee.rollno%type:=10;
   c_fname trainee.fname%type;
   c_lname trainee.lname%type;
begin
   select rollno,fname,lname into c_id,c_fname,c_lname from trainee where rollno=c_id;
   dbms_output.put_line('name' || c_fname);
   dbms_output.put_line('last name' || c_lname);
exception
when no_data_found then
dbms_output.put_line('no such data found');
when others then
dbms_output.put_line('error');
end;
/
