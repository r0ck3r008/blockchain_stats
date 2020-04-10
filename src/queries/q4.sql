/* question 4
avg number of input/output txs per address
cte1 gets the count of addresses involved in contributing a transaction as input.
cte2 gets the count of addresses that ever received a bitcoin through a transaction.
cte3 gets the total input count of transactions
cte4 gets the total output count of transactions.
We then simply average out cte3/cte1 for input tx avg, cte4/cte2 for output tx avg
and cte3+cte4/total addresses for total tx avg */
with cte1 as (
	select count(*) as total_in_addrs
	from (
		select distinct addrid
		from txin
	) a
), cte2 as (
	select count(*) as total_out_addrs
	from (
		select distinct addrid
		from txout
	) a
), cte3 as (
	select sum(n_inputs) as total_in
	from tx
), cte4 as (
	select sum(n_outputs) as total_out
	from tx
)
select 'Average input txs per address', cte3.total_in/(
	select total_in_addrs
	from cte1
)
from cte3
union
select 'Average output txs per address', cte4.total_out/(
	select total_out_addrs
	from cte2
)
from cte4
union
select 'Average txs per address', (
	(
		select total_in
		from cte3
	) +
	(
		select total_out
		from cte4
	)
)/count(*)
from addresses;
