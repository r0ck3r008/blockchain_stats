/* Average Balance per Address */
SELECT (SUM(C.Balance)/(
		SELECT COUNT(*)
		FROM addresses
)) as Average_Balance
FROM (
	SELECT A.addrID as AddressID, (A.Received-B.Spent) AS Balance
	FROM (
		SELECT addrID, SUM(sum) AS Received
		FROM txout
		GROUP BY addrID
		HAVING addrID != -1
	) A
	JOIN (
		SELECT addrID, SUM(sum) AS Spent
		FROM txin
		GROUP BY addrID
		HAVING addrID != -1
	) B
	ON A.addrID=B.addrID
) C;
