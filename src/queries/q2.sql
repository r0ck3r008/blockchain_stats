/* question 2
address with the largest balance */
with cte as (
	select txout.addrid as addrid, sum(txout.sum) as balance
	from txout
	left outer join
	txin
	on txout.txid=txin.prev_txid
	where txin.prev_txid is null
	group by txout.addrid
)
select addresses.hash, a.balance
from addresses
join (
	select cte.addrid as addrid, cte.balance as balance
	from cte
	where balance = (select max(balance) from cte)
) a
on addresses.addrid=a.addrid;
