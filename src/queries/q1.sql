/* question 1
 total number of transactions and
 total number of addresses */
select 'number of transactions: ', count(*)
from txh
union
select 'number of addresses: ', count(*)
from addresses;
