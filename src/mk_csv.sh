#!/bin/sh

zcat bh.dat.gz | sed "s/\t/,/g" > dataset/bh.dat
zcat txh.dat.gz | sed "s/\t/,/g" > dataset/txh.dat
zcat addresses.dat.gz | sed "s/\t/,/g" > dataset/addresses.dat
xzcat tx.dat.xz | sed "s/\t/,/g" > dataset/tx.dat
xzcat txin.dat.xz | sed "s/\t/,/g" > dataset/txin.dat
xzcat txout.dat.xz | sed "s/\t/,/g" > dataset/txout.dat
zcat multiple.dat.gz | sed "s/\t/,/g" > dataset/multiple.dat
zcat nonstandard.dat.gz | sed "s/\t/,/g" > dataset/nonstandard.dat
zcat addr_sccs.dat.gz | sed "s/\t/,/g" > dataset/addr_sccs.dat
