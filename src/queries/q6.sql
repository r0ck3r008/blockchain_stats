/* question 6
average transaction value */
with cte1 as (
	select count(txid) as tx_count
	from txout
), cte2 as (
	select sum(sum) as total_sum
	from txout
)
select cte2.total_sum/(
	select sum(tx_count)
	from cte1
) as avg_tx_value
from cte2;
