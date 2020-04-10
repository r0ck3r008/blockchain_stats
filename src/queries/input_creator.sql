/* combined output of serial and joint control.
Here the union operator gives the sorted and distinct
output thus eliminating the need to prepare this csv
any further. Just run it in the way mentioned in the
sccs32s repository */
\copy ( select txout.txid as txid, txout.addrid as addrid from tx join txout on tx.txid=txout.txid where tx.n_outputs=1 union select txin.txid as txid, txin.addrid as addrid from txin ) to '../dataset/out.csv' with csv delimiter E'\t';
