/* question 5
transaction with greatest number of inputs */
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
