SELECT addresses.addrID as AddrID, COUNT(txin.txID) as TxIn
FROM addresses
JOIN txin
ON addresses.addrID=txin.addrID
GROUP BY addresses.addrID;
