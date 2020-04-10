/* question 11
average balance per user
cte1 calculates all the UTXO balance available in the database.
cte2 calculates total number of users in database
Then we simply take their average*/
with cte1 as (
	select sum(txout.sum) as utxo_balance
	from txout
	left outer join
	txin
	on txout.txid=txin.prev_txid
	where txin.prev_txid is null
), cte2 as (
	select count(a.userid) as total_users
	from (
		select distinct userid
		from users
	) a
)
select utxo_balance/(
	select total_users
	from cte2
) as avg_utxo_bal_per_user
from cte1;
