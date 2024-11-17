set serveroutput on

declare 
    cid number := &cid;
    cname varchar2(50);
    unit number;
    cost number;
    cursor billi is
    select * from bill
    where id = cid;
    billrcrd billi%rowtype;

begin
    open billi;
        loop
            fetch billi into billrcrd;
            exit when billi%notfound;
            cname := billrcrd.name;
            unit := billrcrd.units;
            if unit <= 100 then
                cost := unit * 5;
            elsif (unit <= 300) then
                cost := unit * 7;
            elsif (unit <= 500) then
                cost := unit * 15;
            else
                cost := unit * 20;
            end if;
            dbms_output.put_line('Name: '||cname||' Units: '||unit||' Cost: '||cost);
        end loop;
    close billi;
exception
    when others then
        dbms_output.put_line('Error');
        if billi%isopen then
            close billi;
        end if;
end;
/
        
