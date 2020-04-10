/* question 8
average number of transactions per block */
select (
	select count(txid) as total_tx
	from tx
)/ count(blockid) as avg_tx_per_block
from bh;

