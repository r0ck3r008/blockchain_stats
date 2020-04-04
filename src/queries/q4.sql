/* Avg number of input/output txs per address */
WITH NAddresses AS (
	SELECT COUNT(*) AS TotalAddresses
	FROM addresses
)
SELECT	(SUM(C.OutTxs)/(
		SELECT TotalAddresses
		FROM NAddresses
)) AS AvgOutTxs,
	(SUM(C.InTxs)/(
			SELECT TotalAddresses
			FROM NAddresses
	)) AS AverageInTxs,
(SUM(C.TotalTxs)/(
		SELECT TotalAddresses
		FROM NAddresses
)) AS AverageTotalTxs
FROM (
	SELECT A.OutTxs AS OutTxs, B.InTxs AS InTxs, (A.OutTxs+B.InTxs) AS TotalTxs
	FROM (
		SELECT addrID, COUNT(*) AS OutTxs
		FROM txout
		GROUP BY addrID
		HAVING addrID != -1
	) A
	JOIN (
		SELECT addrID, COUNT(*) as InTxs
		FROM txin
		GROUP BY addrID
		HAVING addrID != -1
	) B
	ON A.addrID=B.addrID
) C;
