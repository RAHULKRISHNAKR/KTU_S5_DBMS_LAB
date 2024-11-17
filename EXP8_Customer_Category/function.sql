set serveroutput on

create table exp8customer(custid varchar2(5), custname varchar2(10), accountbal number);

insert into exp8customer values('C001','Amit',10000);
insert into exp8customer values('C002','Rahul',50000);
insert into exp8customer values('C003','Rohit',100000);
insert into exp8customer values('C004','Raj',5000);
insert into exp8customer values('C005','Ravi',20000);

select * from exp8customer;


create or replace function cuscat(accbal number)
return varchar2
is 
    cat varchar2(20);
begin
    if accbal > 50000 then
        cat := 'Platinum';
    elsif accbal > 10000 and accbal < 5000 then
        cat := 'Gold';
    else
        cat := 'Silver';
    end if;
    return cat;
end;
/