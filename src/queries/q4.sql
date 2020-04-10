/* question 4
avg number of input/output txs per address */
with naddresses as (
	select count(*) as totaladdresses
	from addresses
)
select	(sum(c.outtxs)/(
		select totaladdresses
		from naddresses
)) as avgouttxs,
	(sum(c.intxs)/(
			select totaladdresses
			from naddresses
	)) as averageintxs,
(sum(c.totaltxs)/(
		select totaladdresses
		from naddresses
)) as averagetotaltxs
from (
	select a.outtxs as outtxs, b.intxs as intxs, (a.outtxs+b.intxs) as totaltxs
	from (
		select addrid, count(*) as outtxs
		from txout
		group by addrid
		having addrid != -1
	) a
	join (
		select addrid, count(*) as intxs
		from txin
		group by addrid
		having addrid != -1
	) b
	on a.addrid=b.addrid
) c;
