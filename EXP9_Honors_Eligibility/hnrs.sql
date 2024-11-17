set serveroutput on

create table students(rollno varchar2(5) primary key, name varchar2(5), s1 number, s2 number);

insert into students values('1', 'A', 90, 80);
insert into students values('2', 'B', 80, 90);
insert into students values('3', 'C', 70, 70);
insert into students values('4', 'D', 60, 60);
insert into students values('5', 'E', 50, 50);
insert into students values('6', 'F', 40, 40);
insert into students values('7', 'G', 30, 30);
insert into students values('8', 'H', 20, 20);
insert into students values('9', 'I', 10, 10);
insert into students values('10', 'J', 0, 0);


declare
    cursor hsc 
    is 
    select rollno,name,s1,s2 from students
    where (s1+s2)>100;
    studrec hsc%rowtype;
    highscore number;
begin
    open hsc;
        loop
            fetch hsc into studrec;
            exit when hsc%notfound;
            highscore:= greatest(studrec.s1,studrec.s2);
            dbms_output.put_line('Rollno: '||studrec.rollno||' Name: '||studrec.name||' Highscore: '||highscore);
        end loop;
    close hsc;
exception
    when others then
        dbms_output.put_line('Error');
        if hsc%isopen then
            close hsc;
        end if;
end;
/