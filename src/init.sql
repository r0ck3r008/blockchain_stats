create table bh
(
	blockid int,
	hash varchar(120),
	block_timestamp int,
	n_txs int
);

create table txh
(
	txid int,
	hash varchar(120)
);

create table addresses
(
	addrid int,
	hash varchar(120)
);

create table tx
(
	txid int,
	blockid int,
	n_inputs int,
	n_outputs int
);

create table txin
(
	txid int,
	input_seq int,
	prev_txid int,
	prev_output_seq int,
	addrid int,
	sum bigint
);

create table txout
(
	txid int,
	output_seq int,
	addrid int,
	sum bigint
);

copy bh
from '/dataset/bh.dat';

copy txh
from '/dataset/txh.dat';

copy addresses
from '/dataset/addresses.dat';

copy tx
from '/dataset/tx.dat';

copy txin
from '/dataset/txin.dat';

copy txout
from '/dataset/txout.dat';
