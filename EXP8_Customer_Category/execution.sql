set linsize 500

select custname as Name ,accountbal as Balance,cuscat(accountbal) as category from exp8customer;
