#!/bin/bash

zcat bh.dat.gz | sed "s/\t/,/g" | sed -e "1iblockID,hash,block_timestamp,n_txs" | head -n 212577 > dataset/bh.dat
zcat txh.dat.gz | sed "s/\t/,/g" | sed -e "1itxID,hash" | head -n 10000056 > dataset/txh.dat
zcat addresses.dat.gz | sed "s/\t/,/g" | sed -e "1iaddrID,address" | head -n 8385066 > dataset/addresses.dat
xzcat tx.dat.xz | sed "s/\t/,/g" | sed -e "1itxID,blockID,n_inputs,n_outputs" | head -n 10000056 > dataset/tx.dat
xzcat txin.dat.xz | sed "s/\t/,/g" | sed -e "1itxID,input_seq,prev_txID,prev_output_seq,addrID,sum" | head -n 20168555 > dataset/txin.dat
xzcat txout.dat.xz | sed "s/\t/,/g" | sed -e "1itxID,output_seq,addrID,sum" | head -n 23266808 > dataset/txout.dat
#zcat multiple.dat.gz | sed "s/\t/,/g" | > dataset/multiple.dat
#zcat nonstandard.dat.gz | sed "s/\t/,/g" | > dataset/nonstandard.dat
#zcat addr_sccs.dat.gz | sed "s/\t/,/g" | > dataset/addr_sccs.dat
