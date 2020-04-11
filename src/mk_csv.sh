#!/bin/bash

zcat "${1}"/bh.dat.gz | head -n 212576 > "${1}"/bh.dat
zcat "${1}"/txh.dat.gz | head -n 10000055 > "${1}"/txh.dat
zcat "${1}"/addresses.dat.gz | head -n 8385065 > "${1}"/addresses.dat
xzcat "${1}"/tx.dat.xz | head -n 10000055 > "${1}"/tx.dat
xzcat "${1}"/txin.dat.xz | head -n 20168554 > "${1}"/txin.dat
xzcat "${1}"/txout.dat.xz | head -n 23266807 > "${1}"/txout.dat
