SELECT (A.NTxs/(
		SELECT COUNT(*)
		FROM bh
)) AS AvgTxPerBlock
FROM (
	SELECT COUNT(*) AS NTxs
	FROM tx
) A;
