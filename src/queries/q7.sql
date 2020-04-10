/* question 7
total coinbase transactions */
select count(txid) as coinbase_transactions
from tx
where n_inputs=0;
