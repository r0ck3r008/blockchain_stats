/* Richest address in Databse */
SELECT hash AS AddressHash, C.Balance
FROM addresses
JOIN (
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
) C
ON addresses.addrID=C.AddressID
WHERE C.Balance != 0
ORDER BY C.Balance DESC
LIMIT 1;
