SELECT txh.hash AS TxHash, A.n_inputs AS MaxInputs
FROM txh
JOIN (
	SELECT txID, n_inputs
	FROM tx
	WHERE n_inputs IN (
		SELECT MAX(n_inputs)
		FROM tx
	)
) A
ON txh.txID=A.txID;
