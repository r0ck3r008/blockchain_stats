/* question 3
average balance per address
As in q2.sql, we find utxo balance per address
but instead of joining to addresses table to find the hash of address,
we instead calculate average of total balnce over total count of addresses*/
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
