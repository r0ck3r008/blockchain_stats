#!/bin/bash

make -C sccs32s/

cat dataset/out.csv | awk 'BEGIN{txl=0;addrl=0;addrl2=0;}{if($1 == txl) { if(addrl != $2) print addrl,$2; if(addrl2 != $2) print addrl2,$2;  } else  { txl = $1; addrl = $2; } addrl2 = $2;}' | sort -S 1G | uniq > dataset/addr_edges.dat

lines="$(wc -l dataset/addr_edges.dat | cut -d ' ' -f 1)"

sccs32s/sccs32s.out -N $lines -t sccstmp -r < dataset/addr_edges.dat > dataset/addr_sccs.dat

make -C sccs32s/ clean
