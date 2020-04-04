CREATE TABLE addresses
(
	addrID int,
	hash varchar(120)
);

COPY addresses
FROM '/dataset/addresses.dat' DELIMITER ',' CSV HEADER;
