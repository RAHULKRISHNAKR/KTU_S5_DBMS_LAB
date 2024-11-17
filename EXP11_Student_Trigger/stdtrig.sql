create table stud(sno number primary key, name varchar2(20),s1 number, s2 number,s3 number,TOTAL number,avg number);

create or replace trigger studavg 
before insert or update
on stud
for each row
begin   
    :new.total := nvl(:new.s1,0) + nvl(:new.s2,0) + nvl(:new.s3,0);
    :new.avg := :new.total/3;
end;
/

insert into stud values(1,'A',90,80,70,0,0);
insert into stud values(2,'B',80,90,70,0,0);
insert into stud values(3,'C',70,70,70,0,0);
insert into stud values(4,'D',60,60,60,0,0);
insert into stud values(5,'E',50,50,50,0,0);
insert into stud values(6,'F',40,40,40,0,0);
insert into stud values(7,'G',30,30,30,0,0);
insert into stud values(8,'H',20,20,20,0,0);