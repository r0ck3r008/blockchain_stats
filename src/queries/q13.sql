/* question 13
tx which paid highest amount to user with most balance
cte1 calculates the UTXO per address in the databse.
cte2 gets the maxmimum balance in all of the UTXOs of addresses.
cte3 gets the max address and max balance tuple.
cte4 gets all the address ids that belong to the user controlling.
cte5 finds all the transactions that user controlling maxmimum balance has.
cte6 then finds all the input transactions to those in cte6.
cte7 mamimum of the transactionid and sum in cte6
Then we simply join cte7 to txh to find the hash of that transaction */
with cte1 as (
	select txout.addrid as addrid, sum(txout.sum) as balance
	from txout
	left outer join
	txin
	on txout.txid=txin.prev_txid
	where txin.prev_txid is null
	group by txout.addrid
), cte2 as (
	select balance as max_balance
	from cte1
	where balance=(
		select max(balance)
		from cte1
	)
), cte3 as (
	select cte1.addrid as max_address, cte1.balance as max_balance
	from cte1
	where cte1.balance=(
		select max_balance
		from cte2
	)
), cte4 as (
	select users.addrid as max_addrids
	from users
	where users.userid = (
		select users.userid max_user
		from users
		join cte3
		on users.addrid=cte3.max_address
	)
), cte5 as (
	select txout.txid as txids
	from txout
	join cte4
	on txout.addrid=cte4.max_addrids
), cte6 as (
	select txin.prev_txid as ip_txid, txin.sum as ip_sum
	from txin
	join cte5
	on txin.txid=cte5.txids
), cte7 as (
	select cte6.ip_txid as max_txid, cte6.ip_sum as max_sum
	from cte6
	where cte6.ip_sum=(
		select max(ip_sum)
		from cte6
	)
)
select txh.hash as tx_hash, cte7.max_sum as max_sum
from txh
join cte7
on txh.txid=cte7.max_txid;
