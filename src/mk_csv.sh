#!/bin/bash

zcat "${1}"/bh.dat.gz | head -n 212576 > dataset/bh.dat
zcat "${1}"/txh.dat.gz | head -n 10000055 > dataset/txh.dat
zcat "${1}"/addresses.dat.gz | head -n 8385065 > dataset/addresses.dat
xzcat "${1}"/tx.dat.xz | head -n 10000055 > dataset/tx.dat
xzcat "${1}"/txin.dat.xz | head -n 20168554 > dataset/txin.dat
xzcat "${1}"/txout.dat.xz | head -n 23266807 > dataset/txout.dat
#zcat multiple.dat.gz | sed "s/\t/,/g" | > dataset/multiple.dat
#zcat nonstandard.dat.gz | sed "s/\t/,/g" | > dataset/nonstandard.dat
#zcat addr_sccs.dat.gz | sed "s/\t/,/g" | > dataset/addr_sccs.dat
