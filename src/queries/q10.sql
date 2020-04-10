/* question 10
user with the largest balance.
cte1 calculates the UTXO per address in the databse.
cte2 gets the maxmimum balance in all of the UTXOs of addresses.
cte3 gets the max address and max balance tuple.
cte4 gets all the address ids that belong to the user controlling
max address calculated by cte3
Then we simply join the output of cte4 with addresses table to get hashes
and union with maxmimum balance typecasted to string.*/
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
)
select 'max balance: ', cast(max_balance as varchar(120))
from cte2
union
select 'Addresses: ', addresses.hash as address
from addresses
join cte4
on addresses.addrid=cte4.max_addrids;
