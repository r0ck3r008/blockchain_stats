/* question 4
avg number of input/output txs per address
cte1 gets the total input count of transactions
cte2 gets the total output count of transactions.
cte3 gets the count of all unique users from users table
We then simply average out cte1/cte3 for input tx avg, cte2/cte3 for output tx avg
and cte1+cte2/cte3 for total tx avg */
with cte1 as (
	select sum(n_inputs) as total_in
	from tx
), cte2 as (
	select sum(n_outputs) as total_out
	from tx
), cte3 as (
	select count(*) as total_users
	from (
		select distinct userid
		from users
	) a
)
select 'Average input txs per user', (
	select total_in
	from cte1
)/total_users
from cte3
union
select 'Average output txs per user', (
	select total_out
	from cte2
)/total_users
from cte3
union
select 'Average txs per user', (
	(
		select total_in
		from cte1
	) +
	(
		select total_out
		from cte2
	)
)/total_users
from cte3;
