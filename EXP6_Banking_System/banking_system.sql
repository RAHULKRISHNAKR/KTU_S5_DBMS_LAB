set serveroutput on

declare
     accnum number(10);
     bal number(10);
     minbal number(10) := 500;
     debit number(10);
     credit number(10);
     choice number(1);

PROCEDURE deposit(accnum in number,bal in number)
        is 
        begin
            credit := &credit;
            update accounts 
            set balance = balance +credit 
            where acconum = accnum;
            dbms_output.put_line('Amount deposited successfully');
            commit;
        end deposit;

procedure withdraw(accnum in number,bal in number)
        is 
        begin
            debit := &debit;
            if bal - debit >= minbal then
                update accounts 
                set balance = balance - debit 
                where acconum = accnum;
                dbms_output.put_line('Amount withdrawn successfully');
                commit;
            else
                dbms_output.put_line('Insufficient balance');
            end if;
        end withdraw;

begin
    accnum := &accnum;
    select balance into bal from accounts where acconum = accnum;

    choice := &choice;
    if choice = 1 then
        deposit(accnum,bal);
    else
        withdraw(accnum,bal);
    end if;
end;
/