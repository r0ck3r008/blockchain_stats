CREATE TABLE bh
(
	blockID int,
	hash varchar(120),
	block_timestamp int,
	n_txs int
);

CREATE TABLE txh
(
	txID int,
	hash varchar(120)
);

CREATE TABLE addresses
(
	addrID int,
	hash varchar(120)
);

CREATE TABLE tx
(
	txID int,
	blockID int,
	n_inputs int,
	n_outputs int
);

CREATE TABLE txin
(
	txID int,
	input_seq int,
	prev_txID int,
	prev_output_seq int,
	addrID int,
	sum bigint
);

CREATE TABLE txout
(
	txID int,
	output_seq int,
	addrID int,
	sum bigint
);

COPY bh
FROM '/dataset/bh.dat';

COPY txh
FROM '/dataset/txh.dat';

COPY addresses
FROM '/dataset/addresses.dat';

COPY tx
FROM '/dataset/tx.dat';

COPY txin
FROM '/dataset/txin.dat';

COPY txout
FROM '/dataset/txout.dat';

