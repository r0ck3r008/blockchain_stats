create table users
(
	addrid int,
	userid int
);

copy users
from '/dataset/addr_sccs.dat';
