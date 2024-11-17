set serveroutput on

create table students(sid varchar2(5) primary key, name varchar2(5), marks number);

insert into students values('S1', 'Ronal', 50);
insert into students values('S2', 'Paulu', 60);
insert into students values('S3', 'Paul', 70);
insert into students values('S4', 'Parthiv', 80);
insert into students values('S5', 'Vignesh', 90);


declare
    avgmarks number;
    cdate date;
    cweek varchar2(10);

begin

    select avg(marks) into avgmarks from students;
    dbms_output.put_line('Average marks: ' || avgmarks);
    if avgmarks<40 then
        dbms_output.put_line('Low Avg Marks!');
    else
        dbms_output.put_line('High Avg Marks!');
    end if;
    cdate := sysdate;
    dbms_output.put_line('Todays Date is: ' || cdate);
    cweek := to_char(cdate, 'DAY');
    dbms_output.put_line('Todays day is: ' || cweek);
end;
/