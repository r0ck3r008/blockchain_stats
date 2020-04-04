/* Query 1 */
SELECT 'Number of Transactions: ', COUNT(*)
FROM txh
UNION
SELECT 'Number of Addresses: ', COUNT(*)
FROM addresses;
