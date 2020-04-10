/* question 3
average balance per address */
with cte as (
	select txout.addrid as addrid, sum(txout.sum) as balance
	from txout
	left outer join
	txin
	on txout.txid=txin.prev_txid
	where txin.prev_txid is null
	group by txout.addrid
)
select sum(balance)/count(addrid) as avg_balance
from cte;
