/* Average transaction value */
SELECT SUM(A.TxOutSum)/SUM(A.TxCount) AS AverageTxValue
FROM (
	SELECT COUNT(tx.txID) AS TxCount, SUM(txout.sum) AS TxOutSum
	FROM tx
	JOIN txout
	ON tx.txID=txout.txID
	GROUP BY tx.blockID
) A;
