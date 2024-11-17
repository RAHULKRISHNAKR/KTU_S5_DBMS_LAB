set serveroutput on

create table train(tno number primary key,tname varchar2(20),tdate date,destination varchar2(20),seat number);

create sequence tseq start with 1 increment by 1;

insert into train values(tseq.nextval,'Rajdhani',to_date('01-01-2020','dd-mm-yyyy'),'Delhi',100);
insert into train values(tseq.nextval,'Shatabdi',to_date('01-01-2020','dd-mm-yyyy'),'Mumbai',100);
insert into train values(tseq.nextval,'Duronto',to_date('01-01-2020','dd-mm-yyyy'),'Kolkata',100);
insert into train values(tseq.nextval,'Garib Rath',to_date('01-01-2020','dd-mm-yyyy'),'Chennai',100);
insert into train values(tseq.nextval,'Jan Shatabdi',to_date('01-01-2020','dd-mm-yyyy'),'Bangalore',100);



create or replace procedure reserve(trainno in number, sneed in number)
as
    seatavail number;
    begin
        select seat into seatavail from train where tno=trainno;
        if seatavail>=sneed then
        update train set seat=seat-sneed where tno=trainno;
        dbms_output.put_line('Seats Reserved');
        else
        dbms_output.put_line('Seats Not Available');
        end if;
        exception
        when no_data_found then
        dbms_output.put_line('Invalid Train Number');
end reserve;
/

create or replace procedure cancel(trainno in number, sneed in number)
as
    begin
        update train set seat=seat+sneed where tno=trainno;
        dbms_output.put_line('Seats Cancelled');
        exception
        when no_data_found then
        dbms_output.put_line('Invalid Train Number');
    end cancel;
/

begin
    dbms_output.put_line('Enter 1 to Reserve Seats');
    dbms_output.put_line('Enter 2 to Cancel Seats');
end;
/

declare
    trainno number := &trainno;
    seatned number := &seatned;
    choice int := &choice;
begin
    if choice=1 then
    reserve(trainno, seatned);
    elsif choice=2 then
    cancel(trainno, seatned);
    else
    dbms_output.put_line('Invalid Choice');
    end if;
end;
/
