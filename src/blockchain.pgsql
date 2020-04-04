--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    addrid integer,
    hash character varying(120)
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: bh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bh (
    blockid integer,
    hash character varying(120),
    block_timestamp integer,
    n_txs integer
);


ALTER TABLE public.bh OWNER TO postgres;

--
-- Name: nonstandard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nonstandard (
    txid integer,
    output_seq integer
);


ALTER TABLE public.nonstandard OWNER TO postgres;

--
-- Name: tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tx (
    txid integer,
    blockid integer,
    n_inputs integer,
    n_outputs integer
);


ALTER TABLE public.tx OWNER TO postgres;

--
-- Name: txh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.txh (
    txid integer,
    hash character varying(120)
);


ALTER TABLE public.txh OWNER TO postgres;

--
-- Name: txin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.txin (
    txid integer,
    input_seq integer,
    prev_txid integer,
    prev_output_seq integer,
    addrid integer,
    sum bigint
);


ALTER TABLE public.txin OWNER TO postgres;

--
-- Name: txout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.txout (
    txid integer,
    output_seq integer,
    addrid integer,
    sum bigint
);


ALTER TABLE public.txout OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    uid integer,
    addrid integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (addrid, hash) FROM stdin;
\.


--
-- Data for Name: bh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bh (blockid, hash, block_timestamp, n_txs) FROM stdin;
\.


--
-- Data for Name: nonstandard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nonstandard (txid, output_seq) FROM stdin;
\.


--
-- Data for Name: tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tx (txid, blockid, n_inputs, n_outputs) FROM stdin;
\.


--
-- Data for Name: txh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.txh (txid, hash) FROM stdin;
\.


--
-- Data for Name: txin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.txin (txid, input_seq, prev_txid, prev_output_seq, addrid, sum) FROM stdin;
\.


--
-- Data for Name: txout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.txout (txid, output_seq, addrid, sum) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (uid, addrid) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

