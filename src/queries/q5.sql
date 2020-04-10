/* question 5
transaction with greatest number of inputs.
We get the txid from tx table having highest number of inputs
and simply join with txh to get the hash of it*/
select txh.hash as tx_hash, a.n_inputs as n_inputs
from txh
join (
	select txid, n_inputs
	from tx
	where n_inputs in (
		select max(n_inputs)
		from tx
	)
) a
on txh.txid=a.txid;
